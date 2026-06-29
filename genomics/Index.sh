#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --job-name=Index
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=60G
#SBATCH --time=05:00:00
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate bwa

cd $WORK/popgen/reference_genome/

bwa-mem2 index acar2_round_2_trimmed.fasta
