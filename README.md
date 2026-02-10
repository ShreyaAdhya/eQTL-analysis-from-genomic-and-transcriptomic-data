# eQTL Analysis Pipeline Using Genomic and Transcriptomic Data

This repository provides a **complete, reproducible pipeline** for performing **cis-eQTL** analyses using genotype and gene expression data.

The workflow uses **PLINK** and **MatrixEQTL**. All code snippets from the original practical have been converted into **standalone, runnable scripts**.

---

## Overview

This pipeline covers the following steps:

- Population stratification analysis using SNP genotype data  
- Detection of gene expression outliers  
- cis-eQTL analysis (SNP → gene expression)  
- Visualization of top associations  

---

## Repository Structure

```
├── data/
│   ├── snp-data.csv
│   ├── rna-data.csv
│   ├── snp-features.csv
│   ├── rna-features.csv
│   └── snp.*                 # PLINK binary files (.bed/.bim/.fam)
│
├── output/
│   ├── plink.genome
│   ├── plink.mds
│   ├── eqtl-cis.txt
│
├── 01_population_stratification.sh
├── 02_plot_snp_mds.R
├── 03_expression_mds.R
├── 04_load_data_matrixeqtl.R
├── 05_run_eqtl.R
├── 06_plot_top_eqtl.R
│
└── README.md
```

---

## Software Requirements

### System Tools
- PLINK v1.9 or later  
- Bash (Linux or macOS environment)  

### R Environment
- R ≥ 4.0  

### Required R Packages
```r
install.packages("MatrixEQTL")
```

### Base R Packages Used
- stats
- utils
- graphics

---

## How to Run the Pipeline

### 1. Population Stratification (PLINK)

```bash
bash 01_population_stratification.sh
```

Outputs:
- output/plink.genome
- output/plink.mds

---

### 2. Visualize SNP Population Structure

```r
source("02_plot_snp_mds.R")
```

---

### 3. Detect Gene Expression Outliers

```r
source("03_expression_mds.R")
```

---

### 4. Load Data into MatrixEQTL Format

```r
source("04_load_data_matrixeqtl.R")
```

---

### 5. Run cis-eQTL Analysis

```r
source("05_run_eqtl.R")
```

Outputs:
- output/eqtl-cis.txt

---

### 6. Plot the Top eQTL

```r
source("06_plot_top_eqtl.R")
```




