#!/bin/bash
#SBATCH -n 53
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_53.txt
#SBATCH -e error_53.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 53 python mpi_code.py 100000)
te=$(mpirun -np 53 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 53, CPU time: $cpu_time seconds" >> cpu_time_results.txt
