#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=12:00:00
#SBATCH --job-name=Baypass
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-99]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate baypass

outprefix=$1
seed=$2

cd /gxfs_work/geomar/smomw629/popgen/data/08.GEA/baypass/thinned

gfile=$(ls genobaypass* | sed -n $(echo $SLURM_ARRAY_TASK_ID)p)
sub=$(echo $gfile | cut -f 2 -d ".")

g_baypass \
-gfile $gfile \
-efile efile_cov2 \
-auxmodel \
-omegafile omegafile \
-poolsizefile poolsize \
-pilotlength 500 \
-outprefix "${sub}_${outprefix}_cov2" \
-nthreads 8 \
-seed "$seed"
