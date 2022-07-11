# 11 Configmap, Secret

## Overview

[Kubernetes道場 11日目 - ConfigMap / Secretについて](https://cstoku.dev/posts/2018/k8sdojo-11/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---
Omit the method using the create command.

### Configmap

use Manifest.  

#### test-cm

```sh
kubectl apply -f test-cm.yaml
kc get configmap/test-cm -o yaml
```

#### Delete Resources

```sh
kubectl delete -f test-cm.yaml
```
