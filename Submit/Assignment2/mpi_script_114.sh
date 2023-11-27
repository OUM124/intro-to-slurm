#!/bin/bash
#SBATCH -n 114
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_114.txt
#SBATCH -e error_114.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 114 python mpi_code.py 100000)
te=$(mpirun -np 114 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 114, CPU time: $cpu_time seconds" >> cpu_time_results.txt
