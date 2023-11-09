#!/bin/bash

# Check Storage Classes
echo "### Storage Classes ###"
kubectl get storageclasses

# Check PVCs
echo -e "\n### Persistent Volume Claims (PVCs) ###"
kubectl get pvc

# Check PVs
echo -e "\n### Persistent Volumes (PVs) ###"
kubectl get pv

# Check Events related to PVCs
echo -e "\n### Events related to PVCs ###"
kubectl get events --field-selector involvedObject.kind=PersistentVolumeClaim

# Check Events related to PVs
echo -e "\n### Events related to PVs ###"
kubectl get events --field-selector involvedObject.kind=PersistentVolume

# Check logs of provisioner pods (adjust based on your provisioner)
echo -e "\n### Logs of Provisioner Pods ###"
kubectl get pods -n <namespace> | grep <provisioner-pod-prefix> | awk '{print $1}' | xargs -I {} kubectl logs {} -n <namespace>
