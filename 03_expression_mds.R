# Load RNA expression data
rna <- read.csv("data/rna-data.csv", row.names = 1)

# Compute distance matrix
rna.dist <- 1 - abs(cor(rna))

# Perform MDS
rna.mds <- cmdscale(rna.dist, eig = TRUE, k = 2)

# Plot RNA MDS
plot(
  rna.mds$points[, 1],
  rna.mds$points[, 2],
  main = "RNA MDS plot",
  xlab = "first",
  ylab = "second",
  pch = 19
)

# Label samples (optional)
text(
  rna.mds$points[, 1],
  rna.mds$points[, 2],
  labels = colnames(rna),
  pos = 3,
  cex = 0.6
)
