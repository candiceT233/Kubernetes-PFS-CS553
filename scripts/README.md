**Overview:**

This repository contains scripts and tools for benchmarking BeeGFS performance within a Kubernetes environment. The provided scripts facilitate BeeGFS installation, interaction, and benchmarking, along with Kubernetes setup and storage provisioning checks.

**Folder structure: **
/
|-- scripts/
|   |-- beegfs_installation.sh
|   |-- beegfs_interaction.sh
|   |-- benchmark.py
|   |-- k8s_setup.sh
|   |-- storage_provisioning_check.sh
|-- README.md

**Scripts**

beegfs_installation.sh:
This script automates the installation process for BeeGFS, ensuring a streamlined setup.

beegfs_interaction.sh:
Use this script for interacting with BeeGFS, including tasks like file creation, deletion, and retrieval.

benchmark.py:
Python script designed for benchmarking BeeGFS performance. Adjust parameters as needed for specific testing scenarios.

k8s_setup.sh:
Automates the setup of a Kubernetes environment, providing a foundation for BeeGFS testing within the cluster.

storage_provisioning_check.sh:
Verifies the provisioning of storage within the Kubernetes environment, ensuring readiness for BeeGFS benchmarking.

**Usage**
BeeGFS Installation:

Run beegfs_installation.sh to install BeeGFS on the desired system.
BeeGFS Interaction:

Utilize beegfs_interaction.sh for common BeeGFS tasks and operations.
Benchmarking:

Execute benchmark.py to benchmark BeeGFS performance. Adjust parameters based on specific testing requirements.
Kubernetes Setup:

Run k8s_setup.sh to automate the setup of a Kubernetes environment.
Storage Provisioning Check:

Execute storage_provisioning_check.sh to ensure proper storage provisioning within the Kubernetes environment.
