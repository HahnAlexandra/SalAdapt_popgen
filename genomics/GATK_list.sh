#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=48:00:00
#SBATCH --job-name=GATK_list
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate var_call

indir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup
outdir=/gxfs_work/geomar/smomw629/popgen/data/04.Aligned_markdup/gatk
refgen=/gxfs_work/geomar/smomw629//popgen/reference_genome/acar2_round_2_trimmed.fasta

cd $indir

java -jar $CONDA_PREFIX/opt/gatk-3.8/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-R $refgen \
-I bamlist.list \
-o $outdir/all_samples_for_indel_realigner.intervals \
-drf BadMate
