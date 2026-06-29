#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=bamqc
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-16]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate bwa

indir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup

cd $indir
inbam=$(ls *_markdup_clip.bam | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)

qualimap bamqc -bam $inbam -nw 200 -outformat HTML --java-mem-size=12G -nt 8
