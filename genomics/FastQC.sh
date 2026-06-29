#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --job-name=FastQC
#SBATCH --array=1-2
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=20G
#SBATCH --time=01:30:00
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate sequence_qc

RUNS=(seq25-02 seq25-04)
RUN=${RUNS[$SLURM_ARRAY_TASK_ID-1]}

cd $WORK/popgen/data/02.Trimming/${RUN}

fastqc -t 10 -o . *.trim.fastq.gz

multiqc .

