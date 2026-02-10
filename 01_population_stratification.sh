# Make plink executable
chmod +x ./plink

# Create output directory
mkdir -p output

# Step 1: Compute pairwise genetic distances
./plink \
  --bfile data/snp \
  --genome \
  --out output/plink

# Step 2: Perform MDS (2 dimensions)
./plink \
  --bfile data/snp \
  --read-genome output/plink.genome \
  --cluster \
  --mds-plot 2 \
  --out output/plink

# Inspect outputs
head output/plink.genome
head output/plink.mds
