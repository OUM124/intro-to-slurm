#!/bin/bash
#SBATCH -n 69
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_69.txt
#SBATCH -e error_69.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 69 python mpi_code.py 100000)
te=$(mpirun -np 69 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 69, CPU time: $cpu_time seconds" >> cpu_time_results.txt
