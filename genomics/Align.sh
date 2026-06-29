#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=4
#SBATCH --mem=60G
#SBATCH --time=24:00:00
#SBATCH --job-name=BWA
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-16]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate bwa

indir=/gxfs_work/geomar/smomw629/popgen/data/02.Trimming/$RUN
bwagenind=$WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta
outdir=$WORK/popgen/data/03.Aligned/$RUN

fq1=$(find $indir -name "*R1_001.trim.fastq.gz" | sort | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
fq2=$(echo $fq1 | sed 's/R1_001.trim.fastq.gz/R2_001.trim.fastq.gz/g')

mapfile=$WORK/popgen/data/01.RawData/${RUN}/sample_names.txt

root=$(echo $fq1 | cut -f 1-5 -d "_" | cut -f 9 -d "/" | grep -f - ${mapfile} | cut -f 2 )

rg=$(echo \@RG\\tID:$root\\tPL:Illumina\\tPU:x\\tLB:Lib1\\tSM:$root)
tempsort=$root.temp
outfile=$outdir/$root.bam

echo $SLURM_ARRAY_TASK_ID
echo $root
echo $fq1
echo $fq2
echo $rg
echo $tempsort
echo $outfile
echo $outdir

bwa-mem2 mem -t 4 -R $rg $bwagenind $fq1 $fq2 | \
samtools view -S -h -u - | \
samtools sort -T $TMPDIR/$tempsort -O BAM -o $outfile

