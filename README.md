# kNNExample

This repository is an attempt to implement a k-Nearest Neighbours algorithm and apply it to a kind of high-dimensional biological data (geometric morphometric analysis - esp. Generalized Procrustes Analysis performed on Landmark data).  There is one R script that contains the implementation of this functions on simulated data, another that contains just the functions, one that applies it to a geometric morphometric dataset, one that compares it to the knn function from the class library, and then pdfs of the output on a simulated dataset based on multiple values of k.  For all of the tutorials, there is an R script, Rmd, and md version of the document.

The kNN algorithm I implement is able to consider the k-nearest neighbours based on (literally) infinite possible distance metrics, since it can calculate any p-norm (most notably, the l2 or Euclidean Norm, the l1 or Taxicab Norm, and the Infinity norm).  For the biological data use, the standard starting process for producing the data involves a projection into a Euclidean tangent space (to allow the calculation of Procrustes Distances), so the l2 norm will be appropriate.

**Suggested Reading Order: kNNTutorial1.md walks you through our implementation of the function and applies it to a boring but easy-to-view 2D dataset, kNNTutorial2.md then goes on to apply the function itself to wing morphology data from work on *Drosophila melanogaster*, adapted from Houle et al 2017, and in kNNTutorial2.md demonstrates an existing implementation in the class library and benchmarks it against ours.**
