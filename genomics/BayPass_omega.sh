#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files
#SBATCH --cpus-per-task=8
#SBATCH --mem=150G
#SBATCH --time=24:00:00
#SBATCH --job-name=Baypass
#SBATCH --output=%x.%A.out
#SBATCH --error=%x.%A.err

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate baypass

cd /gxfs_work/geomar/smomw629/popgen/data/08.GEA/baypass

g_baypass \
-gfile CORE.42.genobaypass \
-poolsizefile CORE.42.poolsize \
-pilotlength 500 \
-outprefix CORE.42 \
-nthreads 8 \
-seed 123
