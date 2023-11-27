#!/bin/bash
#SBATCH -n 123
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_123.txt
#SBATCH -e error_123.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 123 python mpi_code.py 100000)
te=$(mpirun -np 123 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 123, CPU time: $cpu_time seconds" >> cpu_time_results.txt
