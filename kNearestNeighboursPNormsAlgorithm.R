## Naive KNN implementation

set.seed(12)

simulatedDataGroup1 <- data.frame(X = rnorm(100), Y = rnorm(100))
simulatedDataGroup2 <- data.frame(X = rnorm(100, mean = 2), Y = rnorm(100, mean = 2))

combinedData <- data.frame(matrix(nrow = 200, ncol = 2))                                                                    
combinedData[1:100, ] <- simulatedDataGroup1
combinedData[101:200, ] <- simulatedDataGroup2
groupMembership <- c(rep("red", 100), rep("blue", 100))

pdf("rawData.pdf")

plot(combinedData, col = groupMembership, main = "Raw Data")

dev.off()

distNeighbours <- function(classifiedData, unclassifiedPoint, p = c(1L, 2L, Inf)) {
  di <- classifiedData
  for (i in 1:length(unclassifiedPoint)) {
    di[ , i] <- abs(classifiedData[ , i]-unclassifiedPoint[i])
  }
  if (is.finite(p)) {
    exponentiated <- di^p
    distance <- rowSums(exponentiated)
    distance <- distance^(1/p)
  }
  else if (is.infinite(p)) {
    distance <- apply(di, 1, max)
  }
  else {
    exponentiated <- di^2
    distance <- sqrt(rowSums(exponentiated))
    warning("No or unknown distance measure given, defaulting to p=2/euclidean norm.")
  }
  distance
}

kNN <- function(classifiedData, classification, unclassifiedPoint, k, p = 2) {
  distances <- distNeighbours(classifiedData, unclassifiedPoint, p)
  kthneighbour <- sort(distances)[k]
  kNN <- classification[distances <= kthneighbour]
  conclusion <- table(kNN)/k
  list(results = conclusion, k = k, p = p)
}

XInt <- seq(-2.5, 4.5, by = 0.1)
YInt <- seq(-3, 6, by = 0.1)

colMatrix5 <- matrix(nrow = length(YInt), ncol = length(XInt))

for (j in 1:length(XInt)) { ## This loop only works for odd numbers because if doesn't have a case in order to handle a tie.
  for (i in 1:length(YInt)) {
    NN5 <- kNN(combinedData, groupMembership, c(XInt[j], YInt[i]), k = 5, p = 2)
    colMatrix5[i, j] <- names(NN5$results[NN5$results == max(NN5$results)])
  }
}

Xwhich <- rep(NA_integer_, length(colMatrix5))

for (i in ((1:length(XInt))-1)) {
  Xwhich[(1+i*length(YInt)):(length(YInt)+i*length(YInt))] <- (i+1)
}

pointLocations <- data.frame(X = XInt[Xwhich], Y = rep(YInt, length(XInt)))
coloursPoints5 <- c(colMatrix5)

pdf("fiveNearestNeighbours.pdf", height = 9, width = 7)

plot(pointLocations, col = coloursPoints5, cex = 0.3, main = "Classification Map based on 5NN")

dev.off()

colMatrix1 <- matrix(nrow = length(YInt), ncol = length(XInt))

for (j in 1:length(XInt)) {
  for (i in 1:length(YInt)) {
    NN5 <- kNN(combinedData, groupMembership, c(XInt[j], YInt[i]), k = 1, p = 2)
    colMatrix1[i, j] <- names(NN5$results[NN5$results == max(NN5$results)])
  }
}

coloursPoints1 <- c(colMatrix1)

pdf("nearestNeighbour.pdf", height = 9, width = 7)

plot(pointLocations, col = coloursPoints1, cex = 0.3, main = "Classification Map based on 1NN")

dev.off()

colMatrix11 <- matrix(nrow = length(YInt), ncol = length(XInt))

for (j in 1:length(XInt)) {
  for (i in 1:length(YInt)) {
    NN5 <- kNN(combinedData, 
               groupMembership, 
               c(XInt[j], YInt[i]), 
               k = 11, 
               p = 2)
    colMatrix11[i, j] <- names(NN5$results[NN5$results == max(NN5$results)])
  }
}

coloursPoints11 <- c(colMatrix11)

pdf("elevenNearestNeighbours.pdf", height = 9, width = 7)

plot(pointLocations, col = coloursPoints11, cex = 0.3, main = "Classification Map based on 11NN")

dev.off()
