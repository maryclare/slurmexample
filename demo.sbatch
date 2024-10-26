#!/bin/bash

#SBATCH --job-name demo
#SBATCH -o demo_%a.out
#SBATCH -e demo_%a.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time 2-0:00
#SBATCH --mem-per-cpu=1000
#SBATCH --mail-type=ALL
#SBATCH --mail-user=maryclaregri@umass.edu
#SBATCH --array=1-8

cd home/mgriffin/Documents/Research/Demo/Code/
module load R/4.2.0
R --no-restore --no-save < demo.R > demo_"${SLURM_ARRAY_TASK_ID}".Rout 
