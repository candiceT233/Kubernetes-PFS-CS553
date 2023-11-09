#!/bin/bash

# Switch to the root user
sudo su

# Update the package list
apt-get update

# Turn off swap space
swapoff -a

# Update the /etc/fstab file (comment out the swap line)
nano /etc/fstab

# Update the Hostname
nano /etc/hostname

# Note the IP address
ifconfig

# Update the hosts file
nano /etc/hosts

# Set a static IP address (modify /etc/network/interfaces accordingly)
nano /etc/network/interfaces

# Return to the regular user
exit

# Continue with the rest of the script

# Install Docker as a container runtime
sudo apt install -y docker.io

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install kubeadm, kubelet, and kubectl
sudo apt install -y kubeadm kubelet kubectl

# For the master node
if [[ $(hostname) == "master" ]]; then
    # Initialize the Kubernetes cluster (replace <your-pod-network-cidr> with your desired Pod network CIDR)
    sudo kubeadm init --pod-network-cidr=<your-pod-network-cidr>

    # Set up the kubeconfig file for the current user
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    # Deploy a Pod network (flannel in this example)
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

    # (Optional) Allow scheduling Pods on the master node
    kubectl taint nodes --all node-role.kubernetes.io/master-

    # Display cluster information
    kubectl cluster-info

    # Display nodes in the cluster
    kubectl get nodes

# For the worker node
elif [[ $(hostname) == "your-worker-node-name" ]]; then
    # Replace the following with the join command from the master node
    sudo kubeadm join <master-node-ip>:<master-node-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>

fi
