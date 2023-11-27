#!/bin/bash
#SBATCH --job-name=my_job2
#SBATCH --output=out.txt
#SBATCH --error=error.txt

echo "Hello,Slurm!" -> out.txt
