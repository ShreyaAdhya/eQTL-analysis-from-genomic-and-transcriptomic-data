# Output directory
out.dir <- "output"

# Load MDS coordinates
snp.mds <- read.table(
  file.path(out.dir, "plink.mds"),
  header = TRUE,
  sep = "",
  stringsAsFactors = FALSE
)

# Plot SNP MDS
plot(
  snp.mds$C1,
  snp.mds$C2,
  main = "SNP MDS plot",
  xlab = "first",
  ylab = "second",
  pch = 19
)

# Label points (optional)
text(
  snp.mds$C1,
  snp.mds$C2,
  labels = snp.mds$IID,
  pos = 3,
  cex = 0.6
)
