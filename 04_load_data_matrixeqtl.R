# Install and load MatrixEQTL
install.packages("MatrixEQTL")
library(MatrixEQTL)

out.dir <- "output"

# -----------------------------
# Load SNP data
# -----------------------------
snp.data <- SlicedData$new()
snp.data$fileDelimiter <- ","
snp.data$fileOmitCharacters <- "NA"
snp.data$fileSkipRows <- 1
snp.data$fileSkipColumns <- 1
snp.data$fileSliceSize <- 2000
snp.data$LoadFile("data/snp-data.csv")

# -----------------------------
# Load RNA expression data
# -----------------------------
rna.data <- SlicedData$new()
rna.data$fileDelimiter <- ","
rna.data$fileOmitCharacters <- "NA"
rna.data$fileSkipRows <- 1
rna.data$fileSkipColumns <- 1
rna.data$fileSliceSize <- 2000
rna.data$LoadFile("data/rna-data.csv")

# Ensure sample order matches
stopifnot(all(colnames(snp.data) == colnames(rna.data)))

# -----------------------------
# Load population covariates
# -----------------------------
snp.mds <- read.table(
  file.path(out.dir, "plink.mds"),
  header = TRUE,
  sep = "",
  stringsAsFactors = FALSE
)

covariates.data <- SlicedData$new()
covariates.data$initialize(t(snp.mds[, c("C1", "C2")]))

# -----------------------------
# Load genomic locations
# -----------------------------
snp.loc <- read.csv("data/snp-features.csv", row.names = 1)
rna.loc <- read.csv("data/rna-features.csv", row.names = 1)
