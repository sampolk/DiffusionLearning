%% ADVIS Demo
%{
This script loads the Salinas A hyperspectral image and visualizes 
partition generated by the Active Diffusion and VCA-Assisted Image
Segmentation Algorithm. 

The figures generated by this script appear in the following paper: 

     - Polk, Sam L., Cui, Kangning, Plemmons, R. J., and Murphy, J. M., 
       (2022). Active Diffusion and VCA-Assisted Image Segmentation of
       Hyperspectral Images" In Preparation.

(c) Sam L. Polk: samuel.polk@tufts.edu

%}
%% Load Data
clear 
clc 

load('SalinasACorrected.mat') % Contains data and ground truth labels.
load('ADVISHyperparameters') % Contains hyperparameter structure used.

%% Extract Pixel Purity
% We compute pixel Purity 100 times and average due to VCA's stochasticity.
% We make the following remarks: 
%   - This section may take up to 5 minutes depending on your computer.
%   - Due to the stochasticity of the VCA algorithm, it is possible for 
%     there to be slight differences between the endmembers produced by VCA
%     and the resulting trends at different implementations.

pixelPurity = zeros(M*N,1);
for k = 1:100
    % We use the HySime algorithm to estimate the number of endmembers in 
    % the scene 
    [kf,~]=hysime(X'); 
    Hyperparameters.EndmemberParams.K = kf;
    pixelPurity = pixelPurity + (computePurity(X,Hyperparameters))/100; 
end

%% Restrict Analysis to labeled pixels

% find indices of the labeled pixels
idx0 = find(Y==1); 
labeledPts = find(Y>1); 
n = length(labeledPts);

% Restrict to labeled pixels
X = X(labeledPts, :);
Y = Y(labeledPts);
pixelPurity = pixelPurity(labeledPts);

% Perform nearest neighbor searches among the labeled pixels
[Idx_NN, Dist_NN] = knnsearch(X, X, 'K', 1000);
Dist_NN = Dist_NN(:,2:end); 
Idx_NN = Idx_NN(:,2:end);
 
%% Extract Graph

G = extractGraph(X, Hyperparameters, Idx_NN, Dist_NN);

%% Extract KDE and zeta

density = extractKDE(Dist_NN, Hyperparameters);

%% Implement D-VIS

% Run algorithm
C_DVIS = DVIS(X, Hyperparameters, Hyperparameters.DiffusionTime, G, density, pixelPurity);

% Evaluate partition
NMI_DVIS = nmi(C_DVIS, Y);

%% Implement ADVIS

% Budgets at which ADVIS is evaluated. 
budgets = [0:10:100];

% Preallocate memory to store ADVIS image segmentations. 
C_ADVIS = zeros(length(Y),length(budgets));
NMI_ADVIS = zeros(1,length(budgets));

% Run ADVIS across different budget values.
for bIdx = 1:length(budgets)
    % Store budget in Hyperparameter structure
    Hyperparameters.numLabels = budgets(bIdx); 
    
    % Run ADVIS with that budget
    C_ADVIS(:,bIdx) = ADVIS(X, Hyperparameters, Hyperparameters.DiffusionTime, Y, G, density, pixelPurity);

    % Evaluate partition
    NMI_ADVIS(bIdx) = nmi(C_ADVIS(:,bIdx), Y); 
end

%% Plot Performance trends
% This block replicates Fig. 2. in the paper. 
 
close all 
  
plot(budgets, NMI_ADVIS, 'LineWidth', 2)
hold on 
plot(budgets, NMI_DVIS*ones(length(budgets),1), 'LineWidth', 2)

% axes labels
xlabel('Budget, $B$', 'interpreter', 'latex')
ylabel('$NMI(\hat{\mathcal{C}}, \mathcal{C}_{GT})$', 'interpreter', 'latex')

% axes limits
xlim([min(budgets),max(budgets)])
ylim([0,1])

% Title
title('Recovery of Ground Truth Labels by ADVIS', 'interpreter', 'latex')

% legend
legend({'ADVIS', 'D-VIS'}, 'location', 'southeast')

% Scaling
pbaspect([1,1,1])

set(gca,'FontName', 'Times', 'FontSize', 20)

%% Plot Sampling of clusterings
% This block replicates Fig. 3. in the paper. 

% This is the same as the original ground truth labels. 
Y1 = ones(M*N,1);
Y1(labeledPts) = Y;


% Below, we plot the D-VIS clustering.
subplot(2,2,1)
C = zeros(M*N,1);
C(labeledPts)  = C_DVIS;
C = alignClusterings(Y1,C);
eda(C) % eda is a helper function for visualizing HSIs
title('D-VIS Partition', 'interpreter', 'latex')

% Below, we plot the ADVIS clustering with B=20 ground truth labels.
subplot(2,2,2)
C = zeros(M*N,1);
C(labeledPts)  = C_ADVIS(:,3);
C = alignClusterings(Y1,C);
eda(C)
title(strcat('ADVIS Partition, $B=20$'), 'interpreter', 'latex')

% Below, we plot the ADVIS clustering with B=60 ground truth labels.
subplot(2,2,3)
C = zeros(M*N,1);
C(labeledPts)  = C_ADVIS(:,7);
C = alignClusterings(Y1,C);
eda(C)
title(strcat('ADVIS Partition, $B=60$'), 'interpreter', 'latex')

% Below, we plot the ADVIS clustering with B=100 ground truth labels.
subplot(2,2,4)
C = zeros(M*N,1);
C(labeledPts)  = C_ADVIS(:,end);
C = alignClusterings(Y1,C);
eda(C)
title(strcat('ADVIS Partition, $B=100$'), 'interpreter', 'latex')
