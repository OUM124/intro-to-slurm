import matplotlib.pyplot as plt

def plot_results(cores, cpu_times):
    plt.plot(cores, cpu_times, marker='o')
    plt.title('CPU Time vs Number of Cores')
    plt.xlabel('Number of Cores')
    plt.ylabel('CPU Time (seconds)')
    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    import sys

    # Get CPU times from command line arguments
    cpu_times = [float(time) for time in sys.argv[1:]]

    # Generate a list of core numbers based on the length of cpu_times
    cores = list(range(1, len(cpu_times) + 1))

    # Call the function to plot the results
    plot_results(cores, cpu_times)

