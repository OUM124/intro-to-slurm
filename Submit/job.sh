#!/bin/bash
#SBATCH --job-name=my_job2
#SBATCH --output=out.txt
#SBATCH --error=error.txt
#SBATCH --mem-per-cpu=4GB
#SBATCH --cpu-per-task=4

echo "The first job with --mem and  --cpu-per-task"
