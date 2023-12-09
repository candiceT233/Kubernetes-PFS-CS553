**Overview:**

This repository contains scripts and tools for benchmarking BeeGFS performance within a Kubernetes environment. The provided scripts facilitate BeeGFS installation, interaction, and benchmarking, along with Kubernetes setup and storage provisioning checks.

**Folder Structure:**
/
|-- scripts/
|   |-- beegfs_installation.sh
|   |-- beegfs_interaction.sh
|   |-- benchmark.py
|   |-- k8s_setup.sh
|   |-- storage_provisioning_check.sh
|-- README.md

**Scripts:**

1. **beegfs_installation.sh:**
   This script automates the installation process for BeeGFS, ensuring a streamlined setup.

2. **beegfs_interaction.sh:**
   Use this script for interacting with BeeGFS

3. **benchmark.py:**
   Python script designed for benchmarking BeeGFS performance. Adjust parameters as needed for specific testing scenarios.

4. **k8s_setup.sh:**
   Automates the setup of a Kubernetes environment, providing a foundation for BeeGFS testing within the cluster.

5. **storage_provisioning_check.sh:**
   Verifies the provisioning of storage within the Kubernetes environment, ensuring readiness for BeeGFS benchmarking.

**Usage:**

1. **BeeGFS Installation:**
   Run `beegfs_installation.sh` to install BeeGFS on the desired system.

2. **BeeGFS Interaction:**
   Utilize `beegfs_interaction.sh` for common BeeGFS tasks.

3. **Benchmarking:**
   Execute `benchmark.py` to benchmark BeeGFS performance. Adjust parameters based on specific testing requirements.

4. **Kubernetes Setup:**
   Run `k8s_setup.sh` to automate the setup of a Kubernetes environment.

5. **Storage Provisioning Check:**
   Execute `storage_provisioning_check.sh` to ensure proper storage provisioning within the Kubernetes environment.

