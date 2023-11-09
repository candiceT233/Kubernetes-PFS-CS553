#!/bin/bash

#need few changes still
# Create BeeGFS Kubernetes Namespace
kubectl create namespace beegfs

# Deploy BeeGFS Management Daemon (mgmtd) Pods
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-mgmtd/kubernetes/beegfs-mgmtd-daemonset.yaml

# Deploy BeeGFS Storage Daemon (chunkd) Pods
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-chunk/kubernetes/beegfs-chunk-daemonset.yaml

# Deploy BeeGFS Metadata Daemon (metad) Pods
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-meta/kubernetes/beegfs-meta-daemonset.yaml

# Create BeeGFS Storage Pool
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-storage/beegfs-storage-pool.yaml

# Create BeeGFS Client Pods
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-client/kubernetes/beegfs-client.yaml

# Expose BeeGFS Metadata Daemon Service
kubectl expose service beegfs-meta-service --type=LoadBalancer --name=beegfs-meta-service

# Wait for the External IP to be assigned
echo "Waiting for External IP..."
sleep 60  # Adjust the sleep duration based on your cluster setup

# Get External IP for BeeGFS Metadata Daemon
external_ip=""
while [ -z "$external_ip" ]; do
    external_ip=$(kubectl get services -n beegfs beegfs-meta-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    [ -z "$external_ip" ] && sleep 10
done

echo "BeeGFS Metadata Daemon External IP: $external_ip"

# Access BeeGFS
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-client/kubernetes/beegfs-client-configmap.yaml
kubectl apply -f https://raw.githubusercontent.com/beegfs/beegfs/v7.2.1/beegfs-client/kubernetes/beegfs-client-pod.yaml

echo "BeeGFS installed and configured successfully!"
