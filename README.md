# DiffusionLearning

This toolbox allows the implementation of the following diffusion-based clustering algorithms on synthetic and real datasets included in the repository:

- Learning by Unsupervised Nonlinear Diffusion (LUND)
- Multiscale Learning by Unsupervised Nonlinear Diffusion (M-LUND)
- Spatially Regularized Diffusion Learning (SRDL)
- Multiscale Spatially Regularized Diffusion Learning (M-SRDL)
- Diffusion and VCA-Assisted Image Segmentation (D-VIS)
- Active Diffusion and VCA-Assisted Image Segmentation (ADVIS)
    
This package can be used to generate experiments in the following articles:

1. Murphy, J. M., & Polk, S. L. (2022). A multiscale environment for learning by diffusion. Applied and Computational Harmonic Analysis, 57, 58-100.
2. Polk, S. L., & Murphy, J. M. (2021, July). Multiscale clustering of hyperspectral images through spectral-spatial diffusion geometry. In 2021 IEEE International Geoscience and Remote Sensing Symposium (pp. 4688-4691). IEEE.
3. Polk, S. L., Cui, K., Plemmons, R. J., & Murphy, J. M. (2022, July). Active diffusion and VCA-assisted image segmentation of hyperspectral images. In 2022 IEEE International Geoscience and Remote Sensing Symposium (pp. 1364-1367). IEEE.

The following scripts (in the Experiments folder) generate the relevant experiments:

- SADataVisualization.m visualizes Salinas A hyperspectral image. This script is used for experiments that appear in article 1.  
- M_LUND_demo.m implements M-LUND on synthetic data and the Salinas A hyperspectral image. One can compare against related algorithms on Salinas A using this demo as well. These script is used for experiments that appear in article 1.  
- Benchmark.m compares the M-LUND algorithm against related algorithms on eleven benchmark datasets. This script is used for experiments that appear in article 1.  
- M_SRDL_demo.m compares M-SRDL against M-LUND on the Salinas A hyperspectral image. This script is used for experiments that appear in article 2.  
- ADVIS_demo.m compares the ADVIS active learning algorithm against the D-VIS clustering algorithm. This script is used for experiments that appear in article 3.

All datasets required to replicate experiments are contained in this repository. All benchmark datasets used in article 1. were obtained from the UCI Machine Learning Repository:

- https://archive.ics.uci.edu/ml/index.php

Real, publicly available hyperspectral image data used in all papers is contained in this repository. It was obtained from:

- http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes
    
If MMS clustering toolboxes are not in one's path, comparisons against MMS clustering performed in article 1. will automatically be skipped. To run comparisons against MMS clustering, the following toolboxes, written by Zhijing Liu and Mauricio Barahona, must be added to one's path:

- https://github.com/barahona-research-group/GraphBasedClustering
- https://wwwf.imperial.ac.uk/~mpbara/Partition_Stability/

Users are free to modify the Multiscale Diffusion Clustering toolbox as they wish. If you find it useful or use it in any publications, please cite the following papers:

- Polk, S. L., Cui, K., Chan, A. H., Coomes, D. A., Plemmons, R. J., & Murphy, J. M. (2023). Unsupervised Diffusion and Volume Maximization-Based Clustering of Hyperspectral Images. Remote Sensing, 15(4), 1053.
- Polk, S. L., Chan, A. H., Cui, K., Plemmons, R. J., Coomes, D. A., & Murphy, J. M. (2022, July). Unsupervised detection of ash dieback disease (_Hymenoscyphus fraxineus_) using diffusion-based hyperspectral image clustering. In 2022 IEEE International Geoscience and Remote Sensing Symposium (pp. 2287-2290). IEEE.
- Polk, S. L., Cui, K., Plemmons, R. J., & Murphy, J. M. (2022, July). Active diffusion and VCA-assisted image segmentation of hyperspectral images. In 2022 IEEE International Geoscience and Remote Sensing Symposium (pp. 1364-1367). IEEE.
- Murphy, J. M., & Polk, S. L. (2022). A multiscale environment for learning by diffusion. Applied and Computational Harmonic Analysis, 57, 58-100.
- Polk, S. L., & Murphy, J. M. (2021, July). Multiscale clustering of hyperspectral images through spectral-spatial diffusion geometry. In 2021 IEEE International Geoscience and Remote Sensing Symposium (pp. 4688-4691). IEEE.
- Murphy, J. M., & Maggioni, M. (2019). Spectral–spatial diffusion geometry for hyperspectral image clustering. IEEE Geoscience and Remote Sensing Letters, 17(7), 1243-1247.
- Maggioni, M., & Murphy, J. M. (2019). Learning by Unsupervised Nonlinear Diffusion. Journal of Machine Learning Research, 20(160), 1-56.

Please write with any questions: sam.polk@outlook.com

(c) Copyright Sam L. Polk, 2024.
