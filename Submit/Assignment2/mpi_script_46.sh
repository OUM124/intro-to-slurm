#!/bin/bash
#SBATCH -n 46
#SBATCH -t 00:10:00
#SBATCH -p special
#SBATCH -o output_46.txt
#SBATCH -e error_46.txt
module load OpenMPI/4.0.3-GCC-9.3.0

ts=$(mpirun -np 46 python mpi_code.py 100000)
te=$(mpirun -np 46 python mpi_code.py 100000)
cpu_time=$(echo "$te - $ts" | bc)
echo "Number of cores: 46, CPU time: $cpu_time seconds" >> cpu_time_results.txt
