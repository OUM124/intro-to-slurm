#!/bin/bash
module load OpenMPI/4.0.3-GCC-9.3.0
module load Python/3.8.2-GCCcore-9.3.0
N=100000

output_file="cpu_time_results.txt"

for cores in {1..128}; do
    # Generate SLURM batch script for the current number of cores
    script_name="mpi_script_${cores}.sh"
    
    echo "#!/bin/bash" > $script_name
    echo "#SBATCH -n $cores" >> $script_name
    echo "#SBATCH -t 00:10:00" >> $script_name
    echo "#SBATCH -p special" >> $script_name
    echo "#SBATCH -o output_${cores}.txt" >> $script_name
    echo "#SBATCH -e error_${cores}.txt" >> $script_name
    echo "module load OpenMPI/4.0.3-GCC-9.3.0" >> $script_name  # Load OpenMPI module
    echo "" >> $script_name
    echo "ts=\$(mpirun -np $cores python mpi_code.py $N)" >> $script_name
    echo "te=\$(mpirun -np $cores python mpi_code.py $N)" >> $script_name
    echo "cpu_time=\$(echo \"\$te - \$ts\" | bc)" >> $script_name
    echo "echo \"Number of cores: $cores, CPU time: \$cpu_time seconds\" >> $output_file" >> $script_name
    
    # Make the script executable
    chmod +x $script_name
    
    # Execute the SLURM batch script and store CPU time in the array
    cpu_time=$(sbatch $script_name | awk '{print $4}')
    cpu_times+=("$cpu_time")
done


echo "SLURM scripts submitted for varying the number of cores."

# Print the array of CPU times and core numbers
echo "CPU times for each run: ${cpu_times[@]}"
echo "Number of cores: ${cores[@]}"

# Plot the results using the Python script
./plot_results.py "${cores[@]}" "${cpu_times[@]}"
