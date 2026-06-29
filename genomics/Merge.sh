#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=12:00:00
#SBATCH --job-name=merge
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-16]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate bwa

indir1=/gxfs_work/geomar/smomw629/popgen/data/03.Aligned/seq25-02
indir2=/gxfs_work/geomar/smomw629/popgen/data/03.Aligned/seq25-04
outdir=/gxfs_work/geomar/smomw629/popgen/data/03.Aligned/merged

bam1=$(find $indir1 -name "*.bam" | sort | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
bam2=$(find $indir2 -name "*.bam" | sort | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
root=$(echo $bam1 | cut -f 9 -d "/" | cut -f 1 -d ".")

rg=$(echo \@RG\\tID:$root\\tPL:Illumina\\tPU:x\\tLB:Lib1\\tSM:$root)
tempsort=$root.temp
outfile=$outdir/${root}_merged.bam

echo $SLURM_ARRAY_TASK_ID
echo $root
echo $bam1
echo $bam2
echo $rg
echo $tempsort
echo $outfile
echo $outdir

samtools merge -u -c - $bam1 $bam2 | \
samtools sort -T $TMPDIR/$tempsort -O BAM -o $outfile
