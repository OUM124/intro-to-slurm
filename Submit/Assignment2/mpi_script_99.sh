#!/bin/bash
#SBATCH -n 99
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_99.txt
#SBATCH -e error_99.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 99 python mpi_code.py 100000)
te=$(mpirun -np 99 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 99, CPU time: $cpu_time seconds" >> cpu_time_results.txt
