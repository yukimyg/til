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
kubectl apply -f manifests/rs.yaml && kubectl get po -w
```

### Check settings

```sh
kubectl get replicaset
kubectl get pod
```

### Change replica number

Take one of the following methods.  
After this, check settings as above.

#### Edit manifest file

Change `spec:replicas:` of [rs.yaml](manifests/rs.yaml#L6).

#### scale command

```sh
kubectl scale --replicas=1 -f rs.yaml
```

### Delete Resources

```sh
kubectl delete -f manifests/rs.yaml
```
