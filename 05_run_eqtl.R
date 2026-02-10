library(MatrixEQTL)

out.dir <- "output"

# Bonferroni lower-bound threshold
threshold <- 0.05 / 178232

eqtl <- Matrix_eQTL_main(
  snps = snp.data,
  gene = rna.data,
  cvrt = covariates.data,
  pvOutputThreshold = 0,
  pvOutputThreshold.cis = threshold,
  output_file_name.cis = file.path(out.dir, "eqtl-cis.txt"),
  snpspos = snp.loc,
  genepos = rna.loc[, c("geneid", "chr", "left", "right")],
  cisDist = 1e6,
  useModel = modelLINEAR,
  verbose = TRUE,
  pvalue.hist = TRUE,
  min.pv.by.genesnp = FALSE,
  noFDRsaveMemory = FALSE
)

# Number of tests
eqtl$cis$ntests

# Filter significant eQTLs
eqtls <- eqtl$cis$eqtls
eqtls <- eqtls[eqtls$pvalue < 1.03e-08, ]

nrow(eqtls)
