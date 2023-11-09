#!/bin/bash

# Find the name of the BeeGFS client pod
beegfs_client_pod=$(kubectl get pods -n beegfs -o name | grep beegfs-client)

# Connect to the BeeGFS client pod
kubectl exec -it $beegfs_client_pod -n beegfs /bin/bash <<'EOF'
# Check the BeeGFS mount point
df -h

# Navigate and interact with BeeGFS
cd /mnt/beegfs
ls -la

# Copy files to BeeGFS
cp /path/to/local/file /mnt/beegfs/

# Copy files from BeeGFS
cp /mnt/beegfs/file /path/to/local/directory/
EOF
