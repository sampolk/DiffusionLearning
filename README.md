# DiffusionLearning

This toolbox allows the implementation of the following diffusion-based clustering algorithms on synthetic and real datasets included in the repository:

- Learning by Unsupervised Nonlinear Diffusion (LUND)
- Multiscale Learning by Unsupervised Nonlinear Diffusion (M-LUND)
- Spatially Regularized Diffusion Learning (SRDL)
- Multiscale Spatially Regularized Diffusion Learning (M-SRDL)
- Diffusion and VCA-Assisted Image Segmentation (D-VIS)
- Active Diffusion and VCA-Assisted Image Segmentation (ADVIS)
    
This package can be used to generate experiments in the following articles:

1. Murphy, J. M., & Polk, S. L. (2022). "A multiscale environment for learning by diffusion." Applied and Computational Harmonic Analysis, 57, 58-100.
2. Polk, S. L. & Murphy, J. M. (2021) "Multiscale Clustering of Hyperspectral Images Through Spectral-Spatial Diffusion Geometry." Proceedings of the 2021 IEEE International Geoscience and Remote Sensing Symposium IGARSS, 4688-4691.
3. Polk, S. L., Cui, Kangning, Plemmons, R. J., & Murphy, J. M. "Clustering Highly Mixed Hyperspectral Images Using Diffusion and VCA-Assisted Image Segmentation." _To Appear_.
4. Polk, S. L., Cui, Kangning, Plemmons, R. J., & Murphy, J. M. "Active Diffusion and VCA-Assisted Image Segmentation of Hyperspectral Images." _To Appear_

The following scripts (in the Experiments folder) generate the relevant experiments:

- SADataVisualization.m visualizes Salinas A hyperspectral image. This script is used for experiments that appear in article 1.  
- M_LUND_demo.m implements M-LUND on synthetic data and the Salinas A hyperspectral image. One can compare against related algorithms on Salinas A using this demo as well. These script is used for experiments that appear in article 1.  
- Benchmark.m compares the M-LUND algorithm against related algorithms on eleven benchmark datasets. This script is used for experiments that appear in article 1.  
- M_SRDL_demo.m compares M-SRDL against M-LUND on the Salinas A hyperspectral image. This script is used for experiments that appear in article 2.  
<!-- - HSIDataVisualization.m visualizes the Salinas A, Indian Pines, and Jasper Ridge hyperspectral images. This script is used for experiments that appear in article 3.   -->
<!-- - D_VIS_demo.m compares the D-VIS algorithm against related hyperspectral image clustering algorithms. This script is used for experiments that appear in article 3.   -->
- ADVIS_demo.m compares the ADVIS active learning algorithm against the D-VIS clustering algorithm . This script is used for experiments that appear in article 4.

All datasets required to replicate experiments are contained in this repository. All benchmark datasets used in article 1. were obtained from the UCI Machine Learning Repository:

- https://archive.ics.uci.edu/ml/index.php

Real hyperspectral image data (Salinas A, which was used in articles 1., 2., 3., and 4., and Indian Pines, which was used in article 3.) are also contained in this project. Both datasets data are publically available:

- http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes
    
If MMS clustering toolboxes are not in one's path, comparisons against MMS clustering performed in article 1. will automatically be skipped. To run comparisons against MMS clustering, the following toolboxes, written by Zhijing Liu and Mauricio Barahona, must be added to one's path:

- https://github.com/barahona-research-group/GraphBasedClustering
- https://wwwf.imperial.ac.uk/~mpbara/Partition_Stability/

Users are free to modify the Multiscale Diffusion Clustering toolbox as they wish. If you find it useful or use it in any publications, please cite the following papers:

- Polk, S. L., Chan, A. H. A., Cui, Kangning, Plemmons, R. J., Coomes, D. A., & Murphy, J. M. "Unsupervised detection of ash dieback disease (\emph{Hymenoscyphus fraxineus}) using diffusion-based hyperspectral image clustering" _To Appear_
- Polk, S. L., Cui, Kangning, Plemmons, R. J., & Murphy, J. M. "Active Diffusion and VCA-Assisted Image Segmentation of Hyperspectral Images." _To Appear_
- Polk, S. L., Cui, Kangning, Plemmons, R. J., & Murphy, J. M. "Clustering Highly Mixed Hyperspectral Images Using Diffusion and VCA-Assisted Image Segmentation." _To Appear_.
- Murphy, J. M., & Polk, S. L. (2022). "A multiscale environment for learning by diffusion." Applied and Computational Harmonic Analysis, 57, 58-100.
-  Polk, S. L. & Murphy, J. M. (2021) "Multiscale Clustering of Hyperspectral Images Through Spectral-Spatial Diffusion Geometry." Proceedings of the 2021 IEEE International Geoscience and Remote Sensing Symposium IGARSS, 4688-4691.
- Murphy, J. M., & Maggioni, M. (2019). Spectral???spatial diffusion geometry for hyperspectral image clustering. IEEE Geoscience and Remote Sensing Letters, 17(7), 1243-1247.
- Maggioni, M., & Murphy, J. M. (2019). Learning by Unsupervised Nonlinear Diffusion. Journal of Machine Learning Research, 20(160), 1-56.

Please write with any questions: samuel.polk@tufts.edu

(c) Copyright Sam L. Polk, Tufts University, 2022.
