#ior.py

# Import the os module
import os

# Define a list of block sizes to be tested, in bytes
block_sizes = [4 * 1024, 16 * 1024, 32 * 1024, 64 * 1024]

# Define other IOR parameters
access_group_size = 64  # Number of concurrent I/O operations
transfer_size = 1024 * 1024  # Size of each I/O transfer in bytes
duration = 120  # Duration of each IOR test in seconds
output_dir = "ior_results"  # Directory to store IOR results

# Check if the output directory exists, and create it if not
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Loop through each block size
for block_size in block_sizes:
    # Create a filename for the IOR results
    output_file = os.path.join(output_dir, f"ior_results_{block_size}.txt")

    # Define the command to run IOR with the specified parameters
    command = [
        "mpirun",
        "-np",
        "4",  # Number of MPI processes
        "ior",
        "-w",  # Perform write test
        "-r",  # Perform read test
        "-g", str(access_group_size),
        "-b", str(block_size),
        "-t", str(duration),
        "-o", output_file,
    ]

    # Execute the IOR command
    os.system(" ".join(command))

# Print a message indicating where the IOR results are saved
print(f"IOR results saved to: {output_dir}")
