#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=48:00:00
#SBATCH --job-name=GATK
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-16]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate var_call

indir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup
outdir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup/gatk
refgen=/gxfs_work/geomar/smomw629//popgen/reference_genome/acar2_round_2_trimmed.fasta

cd $indir
inbam=$(ls *.bam | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
inbam_name=$(ls *.bam | sed -n $(echo $SLURM_ARRAY_TASK_ID)p | cut -f 1,2 -d "_")
  
java -jar $CONDA_PREFIX/opt/gatk-3.8/GenomeAnalysisTK.jar \
  -T IndelRealigner \
  -R $refgen \
  -I $inbam \
  -targetIntervals $outdir/all_samples_for_indel_realigner.intervals \
  --consensusDeterminationModel USE_READS  \
  -o $outdir/${inbam_name}_realign.bam
