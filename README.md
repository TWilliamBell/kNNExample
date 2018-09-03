# kNNExample

This repository is an attempt to implement a naive k-Nearest Neighbours algorithm (O(n^2)), it is hopefully a lead into a more practical version of the kNN algorithm applied to high-dimensional biological data.  There is one R script that contains the implementation of this program, and then pdfs of the output on a simulated dataset based on multiple values of k.

The kNN algorithm I implement is able to consider the k-nearest neighbours based on (literally) infinite possible distance metrics, since it can calculate any p-norm (most notably, the l2 or Euclidean Norm, the l1 or Taxicab Norm, and the Infinity norm).  For the biological data I will be using, the standard starting process for producing the data involves a projection into a Euclidean tangent space (to allow the calculation of Procrustes Distances), so the l2 norm will be appropriate.
