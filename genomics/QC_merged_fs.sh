#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --time=24:00:00
#SBATCH --job-name=Flagstat
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate bwa

indir=/gxfs_work/geomar/smomw629/popgen/data/03.Aligned/merged
output_file=$indir/flagstat_merged.txt  

for BAM in $indir/*_merged.bam; do  
    echo "File: $(basename $BAM)" >> $output_file  
    samtools flagstat $BAM >> $output_file  
    echo "------------------------" >> $output_file  
done
