#!/bin/bash
#SBATCH -n 31
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_31.txt
#SBATCH -e error_31.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 31 python mpi_code.py 100000)
te=$(mpirun -np 31 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 31, CPU time: $cpu_time seconds" >> cpu_time_results.txt
