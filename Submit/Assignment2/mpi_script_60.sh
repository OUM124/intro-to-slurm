#!/bin/bash
#SBATCH -n 60
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_60.txt
#SBATCH -e error_60.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 60 python mpi_code.py 100000)
te=$(mpirun -np 60 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 60, CPU time: $cpu_time seconds" >> cpu_time_results.txt
