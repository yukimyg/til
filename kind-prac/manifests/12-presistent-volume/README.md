# 12 PersistentVolume, PersistentVolumeClaim, StorageClass

## Overview

[Kubernetes道場 12日目 - PersistentVolume/PersistentVolumeClaim/StorageClassについて](https://cstoku.dev/posts/2018/k8sdojo-12/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---

### PersistentVolume

use Manifest.  

#### pv0001

```sh
kubectl apply -f pv0001.yaml
kubectl get pv,pvc,pod
```
Checking that it is mounted.
```sh
kubectl exec pvc-slow-test -- ls -l / 
kubectl exec pvc-slow-test -- ls -l /data
```

#### Delete Resources

```sh
kubectl delete -f pv0001.yaml
```
---

#### volumeBindingMode

Deploy StorageClass, PersistentVolume, PersistentVolumeClaim
```sh
kubectl apply -f pv-delay-bind.yaml
kubectl get sc,pv,pvc
```

Deploy Pod to be Binding PVC because of [WaitForFirstConsumer](./pv-delay-bind.yaml#L6)

```sh
kubectl apply -f pv-delay-bind-test.yaml
kubectl get sc,pv,pvc,po
```

#### Delete Resources

```sh
kubectl delete -f pv-delay-bind.yaml
kubectl delete -f pv-delay-bind-test.yaml
```
