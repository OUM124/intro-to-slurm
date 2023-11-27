#!/bin/bash
#SBATCH -n 89
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_89.txt
#SBATCH -e error_89.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 89 python mpi_code.py 100000)
te=$(mpirun -np 89 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 89, CPU time: $cpu_time seconds" >> cpu_time_results.txt
