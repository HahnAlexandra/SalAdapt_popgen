#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=2:00:00
#SBATCH --job-name=Div
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate grenedalf

indir=/gxfs_work/geomar/smomw629/popgen/data/05.Grenedalf_results

grenedalf diversity \
  --threads 8 \
  --sync-path $indir/sync_complete_noc.sync \
  --window-type interval \
  --window-interval-width 100000 \
  --window-average-policy window-length \
  --filter-sample-min-count 2 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --tajima-d-denominator-policy empirical-min-read-depth \
  --pool-sizes $indir/pool-sizes_renamed.csv \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _100kb_window \
  --allow-file-overwriting \
  --out-dir /gxfs_work/geomar/smomw629/popgen/data/05.Grenedalf_results

grenedalf diversity \
  --threads 8 \
  --sync-path $indir/sync_complete_noc.sync \
  --window-type interval \
  --window-interval-width 50000 \
  --window-average-policy window-length \
   --filter-sample-min-count 2 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --tajima-d-denominator-policy empirical-min-read-depth \
  --pool-sizes $indir/pool-sizes_renamed.csv \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _50kb_window \
  --allow-file-overwriting \
  --out-dir /gxfs_work/geomar/smomw629/popgen/data/05.Grenedalf_results

 grenedalf diversity \
  --threads 8 \
  --sync-path $indir/sync_complete_noc.sync \
  --window-type interval \
  --window-interval-width 50000 \
  --window-average-policy valid-loci \
   --filter-sample-min-count 2 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --tajima-d-denominator-policy empirical-min-read-depth \
  --pool-sizes $indir/pool-sizes_renamed.csv \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _50kb \
  --allow-file-overwriting \
  --out-dir /gxfs_work/geomar/smomw629/popgen/data/05.Grenedalf_results

grenedalf diversity \
  --threads 8 \
  --sync-path $indir/sync_complete_noc.sync \
  --window-type genome \
  --window-average-policy valid-loci \
  --filter-sample-min-count 2 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --tajima-d-denominator-policy empirical-min-read-depth \
  --pool-sizes $indir/pool-sizes_renamed.csv \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _global_valid \
  --allow-file-overwriting \
  --out-dir $indir

grenedalf diversity \
  --threads 8 \
  --sync-path $indir/sync_complete_noc.sync \
  --window-type genome \
  --window-average-policy window-length \
  --filter-sample-min-count 2 \
  --filter-sample-min-read-depth 40 \
  --filter-sample-max-read-depth 160 \
  --tajima-d-denominator-policy empirical-min-read-depth \
  --pool-sizes $indir/pool-sizes_renamed.csv \
  --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
  --file-suffix _global_window \
  --allow-file-overwriting \
  --out-dir $indir
