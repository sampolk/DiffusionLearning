%{
This script loads a dataset and visualizes partitions generated by the
Multiscale Learning by Unsupervised Nonlinear Diffusion (M-LUND) clustering
algorithm.

One can load and analyze any of the following four datsets:

    1. Overlapping Gaussians in R^3.
    2. Concentric nonlinear rings in R^2.
    3. Data with bottlenecks in R^2. 
    4. The real-world Salinas A hyperspectral image.

Comparisons against related algorithms are supported on the Salinas A HSI
but not on synthetic datasets.

The figures generated by this script appear in the following paper: 

     - Murphy, James M and Polk, Sam L. "A Multiscale Environment for 
       Learning By Diffusion." In Preparation (2021).

(c) Sam L. Polk: samuel.polk@tufts.edu

%}
%%
profile off;
profile on;

%% Choose the dataset

prompt = 'Which dataset? \n 1) 3D Gaussians \n 2) 2D Nonlinear \n 3) 2D Bottleneck \n 4) 2D Manifold Data \n 5) Salinas A HSI\n';
DataSelected = input(prompt);

if DataSelected == 1
    
    disp('Finding suitable sample...')
    [X,Y] = sampleGaussianData(1,3,1000,1000,100);
    compare_on = 0;
    data_name = 'Gaussians';
    load('gaussians-HP.mat')
    disp('Dataset generated')

elseif DataSelected ==2
    
    disp('Finding suitable sample...')
    [X,Y] = sampleNonlinearData(0.2, 1.2, 4, 180, 1200, 4000, 100);
    compare_on = 0;
    data_name = 'Nonlinear';
    load('nonlinear-HP.mat')
    disp('Dataset generated')
    
elseif DataSelected == 3 
    
    disp('Finding suitable sample...') 
    [X,Y] = sampleBottleneckData(0.35,  1, 5, 12, 1000, 1000, 100);
    compare_on = 0;

    data_name = 'Bottleneck';
    load('bottleneck-HP.mat')
    disp('Dataset generated')
    
elseif DataSelected == 4
    
    disp('Finding suitable sample...') 
    [X,Y] = sampleManifoldData();
    compare_on = 0;
    
    data_name = 'Manifold';
    load('manifold-HP.mat')
    disp('Dataset generated')
    
elseif DataSelected == 5
    
    [X,Y] = extract_salinasA();
    data_name = 'SalinasA';
    load('salinasA-HP.mat')
    
    prompt = 'Should we compare against other algorithms? \n 1) Yes \n 2) No\n';
    compareSelected = input(prompt);
    
    if compareSelected == 1
        compare_on = 1;
        mms_on = check_MMS();
        disp('MMS clustering not in path, so it will not be evaluated.')
        disp('To run comparisons against MMS clustering, download these & add to your path:')
        disp(' - https://github.com/barahona-research-group/GraphBasedClustering')
        disp(' - https://www.imperial.ac.uk/~mpbara/Partition_Stability/')
    else
        compare_on = 0;
    end
    
else
    disp('Incorrect prompt input. Please enter one of [1,2,3,4].')
end

%% Choose whether to save results

prompt = 'Should we save everything? \n 1) Yes \n 2) No\n ';
SaveSelected = input(prompt);

if SaveSelected == 1

    save_on = 1;
    
elseif SaveSelected == 2

    save_on = 0;    
    
else
    disp('Incorrect prompt input. Please enter one of [1,2].')
end

%% Choose whether to plot results

prompt = 'Should we plot everything? \n 1) Yes \n 2) No\n';
PlotSelected = input(prompt);

if PlotSelected == 1

    plot_on = 1;
    
    % Choose whether to plot stochastic complements
    prompt = 'Should we plot the intervals? \nStochastic Complementation is computationally expensive. \n 1) Yes \n 2) No\n';
    PlotSelected = input(prompt);

    if PlotSelected == 1

        sc_on = 1;

    elseif PlotSelected == 2

        sc_on = 0;    

    else
        disp('Incorrect prompt input. Please enter one of [1,2].')
    end
    
    
    
elseif PlotSelected == 2

    plot_on = 0;    
    
else
    disp('Incorrect prompt input. Please enter one of [1,2].')
end


%% Run M-LUND

Clusterings = M_LUND(X, Hyperparameters);

%% 
if compare_on
    [C_MMS, C_HSC, C_SLC, C_SLLUND] = make_comparisons(X, Clusterings, mms_on, plot_on);
end

if save_on 
    if compare_on
        save(strcat('M_LUND_Results_', data_name, '.mat'), 'Clusterings', 'X', 'Y', 'Hyperparameters', 'data_name', 'C_MMS', 'C_HSC', 'C_SLC')
    else
        save(strcat('M_LUND_Results_', data_name, '.mat'), 'Clusterings', 'X', 'Y', 'Hyperparameters', 'data_name')
    end
end
%%

close all 
if plot_on
    results_plot = plot_results(X, Clusterings, data_name, sc_on);
end

