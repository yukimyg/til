# Kind prac

## Overview

I learn k8s from [Kubernetes道場](https://cstoku.dev/posts/2018/k8sdojo-01/).  
practice to build k8s cluster with kind on your local enviroment.  

## Requirement

- Docker Demon
- kubectl
- kind

## Usage

### Build Docker Deamon

### Create Cluster

Edit [kind.yaml](kind.yaml) as you like.
Reference is [here](https://kind.sigs.k8s.io/docs/user/configuration).  

```sh
kind create cluster --config kind.yaml
kubectl get node
```

### Deploy Resources

```sh
kubectl apply -f manifests/nginx.yaml
```

### Check containers settings

```sh
kc exec nginx -- ps
kc exec nginx -- env
kc exec nginx -- readlink /proc/1/cwd
```

### Delete Resources

```sh
kubectl delete -f manifests/nginx.yaml
```
