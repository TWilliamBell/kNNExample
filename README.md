# kNNExample

Yes, k-nearest neighbour algorithms have been better implemented in XYZ package probably, but I am trying to get at the actual methods used underneath the hood. For an example of this using established functions (the class package iirc), see for instance [this repository](https://github.com/DworkinLab/Wing_Biometrics_2015).

This repository is an attempt to implement a naive k-Nearest Neighbours algorithm and apply it to a kind of high-dimensional biological data (geometric morphometric analysis - esp. Generalized Procrustes Analysis performed on Landmark data).  There is one R script that contains the implementation of this functions on simulated data, another that contains just the functions, one that applies it to a geometric morphometric dataset, and then pdfs of the output on a simulated dataset based on multiple values of k.

The kNN algorithm I implement is able to consider the k-nearest neighbours based on (literally) infinite possible distance metrics, since it can calculate any p-norm (most notably, the l2 or Euclidean Norm, the l1 or Taxicab Norm, and the Infinity norm).  For the biological data use, the standard starting process for producing the data involves a projection into a Euclidean tangent space (to allow the calculation of Procrustes Distances), so the l2 norm will be appropriate.
