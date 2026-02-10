# Identify strongest association
idx <- which.min(eqtls$pvalue)

top.gene <- as.character(eqtls$gene[idx])
top.snp  <- as.character(eqtls$snps[idx])

# Function to extract a row from SlicedData
sliced.data.row <- function(object, row) {
  if (is.factor(row)) row <- as.character(row)
  if (is.character(row)) {
    row <- which(rownames(object) == row)
    if (length(row) == 0) stop("Invalid row")
  }
  slice.size <- nrow(object[[1]])
  slice.idx <- floor(row / slice.size) + 1
  slice <- object[[slice.idx]]
  row <- row - slice.size * (slice.idx - 1)
  ret <- slice[row, ]
  names(ret) <- colnames(object)
  ret
}

# Extract data
genotypes <- sliced.data.row(snp.data, top.snp)
genotypes <- factor(genotypes, levels = 0:2, labels = c("AA", "AB", "BB"))

expression.levels <- sliced.data.row(rna.data, top.gene)

# Plot
boxplot(
  expression.levels ~ genotypes,
  main = paste(top.snp, top.gene),
  ylim = range(expression.levels),
  outline = FALSE
)

stripchart(
  expression.levels ~ genotypes,
  method = "jitter",
  add = TRUE,
  vertical = TRUE,
  col = c("blue", "orange", "black"),
  pch = 19
)
