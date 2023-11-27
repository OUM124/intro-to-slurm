#!/bin/bash
#SBATCH -n 73
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_73.txt
#SBATCH -e error_73.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 73 python mpi_code.py 100000)
te=$(mpirun -np 73 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 73, CPU time: $cpu_time seconds" >> cpu_time_results.txt
