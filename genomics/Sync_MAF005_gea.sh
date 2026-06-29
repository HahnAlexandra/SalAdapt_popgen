#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=24:00:00
#SBATCH --job-name=Sync
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate grenedalf

indir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup/gatk

grenedalf sync \
  --threads 8 \
  --sam-path $indir/*_realign.bam \
  --sam-min-base-qual 30 \
  --sam-min-map-qual 30 \
  --rename-samples-list $indir/rename_samples.csv \
  --filter-samples-exclude "IU7_c","LL17_c","SW08_c","WH_22","SK_22" \
  --filter-region-bed $indir/contigs_of_interest.bed \
  --filter-sample-min-count 4 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --filter-total-only-biallelic-snps \
  --filter-total-snp-min-frequency 0.05 \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _gea_min40_MAF005_MAC4 \
  --allow-file-overwriting \
  --out-dir /gxfs_work/geomar/smomw629/popgen/data/05.Grenedalf_results
