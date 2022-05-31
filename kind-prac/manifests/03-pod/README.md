# 03 Pod

## Overview

[Kubernetes道場 3日目 - Podについてとkubectlの簡単な使い方](https://cstoku.dev/posts/2018/k8sdojo-03/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

### Deploy Resources

```sh
kubectl apply -f nginx.yaml
```

### Check pod

```sh
kubectl get pod
```

### Delete Resources

```sh
kubectl delete -f nginx.yaml
```
