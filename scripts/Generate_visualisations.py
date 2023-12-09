import matplotlib.pyplot as plt
import numpy as np

# Metrics data
block_sizes = [4, 16, 32, 64]

# Without BeeGFS values (adjusted for realism)
without_beegfs_write_bandwidth = np.array([])
without_beegfs_read_bandwidth = np.array([])
without_beegfs_write_iops = np.array([])
without_beegfs_read_iops = np.array([])

# With BeeGFS values
with_beegfs_write_bandwidth = np.array([])
with_beegfs_read_bandwidth = np.array([])
with_beegfs_write_iops = np.array([])
with_beegfs_read_iops = np.array([])

# Plotting
fig, axs = plt.subplots(2, 2, figsize=(10, 8))
fig.suptitle('Comparison of Metrics with and without BeeGFS')

# Write Bandwidth
axs[0, 0].plot(block_sizes, without_beegfs_write_bandwidth, label='Without BeeGFS', marker='o')
axs[0, 0].plot(block_sizes, with_beegfs_write_bandwidth, label='With BeeGFS', marker='o')
axs[0, 0].set_title('Write Bandwidth (MiB/sec)')
axs[0, 0].legend()

# Read Bandwidth
axs[0, 1].plot(block_sizes, without_beegfs_read_bandwidth, label='Without BeeGFS', marker='o')
axs[0, 1].plot(block_sizes, with_beegfs_read_bandwidth, label='With BeeGFS', marker='o')
axs[0, 1].set_title('Read Bandwidth (MiB/sec)')
axs[0, 1].legend()

# Write IOPS
axs[1, 0].plot(block_sizes, without_beegfs_write_iops, label='Without BeeGFS', marker='o')
axs[1, 0].plot(block_sizes, with_beegfs_write_iops, label='With BeeGFS', marker='o')
axs[1, 0].set_title('Write IOPS')
axs[1, 0].legend()

# Read IOPS
axs[1, 1].plot(block_sizes, without_beegfs_read_iops, label='Without BeeGFS', marker='o')
axs[1, 1].plot(block_sizes, with_beegfs_read_iops, label='With BeeGFS', marker='o')
axs[1, 1].set_title('Read IOPS')
axs[1, 1].legend()

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()
