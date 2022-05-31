# 04 Container Object

## Overview

[Kubernetes道場 4日目 - Container Objectのフィールドについて](https://cstoku.dev/posts/2018/k8sdojo-04/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

### Deploy Resources

```sh
kubectl apply -f nginx.yaml
```

### Check containers settings

```sh
kc exec nginx -- ps
kc exec nginx -- env
kc exec nginx -- readlink /proc/1/cwd
```

### Delete Resources

```sh
kubectl delete -f nginx.yaml
```
