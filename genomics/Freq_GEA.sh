#!/bin/bash
#SBATCH -D /gxfs_home/geomar/smomw629/popgen/log-files/array_jobs
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=24:00:00
#SBATCH --job-name=Freq
#SBATCH --output=%x.%A.%a.out
#SBATCH --error=%x.%A.%a.err
#SBATCH --array=[1-99]

source "/gxfs_home/geomar/smomw629/miniconda3/usr/etc/profile.d/conda.sh"
conda activate grenedalf

indir=/gxfs_work/geomar/smomw629/popgen/data/08.GEA

cd $indir

num=$SLURM_ARRAY_TASK_ID
snpdet=baypass/thinned/snpdet.sub${num}
bed_tmp=baypass/thinned/snpdet_sub${num}.bed

awk '{
    pos = int($2)
    OFS="\t"
    printf "%s\t%d\t%d\n", $1, pos-1, pos
}' $snpdet > $bed_tmp

grenedalf frequency \
    --threads 8 \
    --sync-path $WORK/popgen/data/05.Grenedalf_results/sync_gea_min40_MAF005_MAC4_SNP.sync \
    --filter-region-bed $indir/$bed_tmp \
    --file-suffix _sub${num}_freq \
    --write-sample-alt-freq \
    --reference-genome-fasta $WORK/popgen/reference_genome/acar2_round_2_trimmed.fasta \
    --allow-file-overwriting \
    --out-dir $indir/rbeta
    
rm $bed_tmp

