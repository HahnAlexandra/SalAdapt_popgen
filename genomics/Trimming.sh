#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --job-name=FastP
#SBATCH --array=1-2
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=60G
#SBATCH --time=05:00:00
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate sequence_qc

RUNS=(seq25-02 seq25-04)
RUN=${RUNS[$SLURM_ARRAY_TASK_ID-1]}

cd $WORK/popgen/data/01.RawData/${RUN}
for NAME in $(ls | cut -f 1-4 -d "_" | sort | uniq); do

  fastp -w 10 \
        -l 40 \
        --cut_right \
        --max_len1 150 \
        --max_len2 150 \
        --dont_eval_duplication \
        -i ${NAME}_R1_001.fastq.gz \
        -I ${NAME}_R2_001.fastq.gz \
        -o ../../02.Trimming/${RUN}/${NAME}_R1_001.trim.fastq.gz \
        -O ../../02.Trimming/${RUN}/${NAME}_R2_001.trim.fastq.gz

done
