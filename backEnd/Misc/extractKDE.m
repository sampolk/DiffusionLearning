function p = extractKDE(Dist_NN, Hyperparameters)
%{
Inputs:     Dist_NN:            nxM matrix where Dist_NN(i,:) encodes the M 
                                nearest neighbors of X(i,:), sorted in 
                                ascending order.
            Hyperparameters:    Structure with the following required 
                                fields:
                                    - DensityNN:    The number of nearest
                                                    neighbors used.
                                    - Sigma0:       The KDE bandwidth. 

Outputs:    p:                  nx1 vector encoding the KDE. 
%}


% Extract hyperparameters
NN = Hyperparameters.DensityNN;
sigma0 = Hyperparameters.Sigma0;

% Calculate density
D_trunc = Dist_NN(:,1:NN); % truncate Dist_NN past the NNth column
p = sum(exp(-(D_trunc.^2)./(sigma0^2)),2); % compute and sum Gaussian kernels
p = p./sum(p); % normalize so that p is a distribution

% avoids p=0 by setting 0-value entries as the minimum value 
p(p == 0) = min(p(p>0)); 