#!/usr/bin/bash
#SBATCH --partition=short               # choose from debug, express, or short
#SBATCH --job-name=alignRNAseq
#SBATCH --time=01:00:00                 # the code pieces should run in far less than 1 hour
#SBATCH -N 1                            # nodes requested
#SBATCH -n 1                            # task per node requested
#SBATCH --output="batch-%x-%j.output"   # where to direct standard output; will be batch-jobname-jobID.output

# Usage: sbatch sbatch_alignRNAseq.sh 

echo "Starting our analysis $(date)"  

echo "Loading our BINF6308 Anaconda environment."
module load anaconda3/2021.11
source activate BINF-12-2021
echo "Loading GSNAP and Samtools."
module load gsnap/2021-12-17
module load samtools/1.10

echo "Make directory for log files"
mkdir -p results/logs/

echo "Build the reference genome $(date)"
bash scripts/AipBuild.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-AipBuild.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-AipBuild.err

echo "Trim all reads in data/rawreads/ $(date)"
bash scripts/trimAll.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trimAll.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trimAll.err

echo "Align the reads to the reference with GSNAP $(date)"
bash scripts/alignAll.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-alignAll.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-alignAll.err

echo "Sort the resulting SAM files $(date)"
bash scripts/sortAll.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-sortAll.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-sortAll.err

echo "Index the resulting BAM files $(date)"
bash scripts/indexAll.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-indexAll.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-indexAll.err

echo "Alignment complete $(date)"
