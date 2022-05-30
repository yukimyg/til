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

edit number of `exit` command in [lifecycle-check.yaml](manifests/lifecycle-check.yaml) to other, try to check the logs and behavior.  
The handler's log can be checked only when the pod is terminated abnormally.

```sh
kubectl apply -f manifests/lifecycle-check.yaml && kubectl get po -w
```

### Check how it was done

```sh
kubectl describe pod lifecycle-check
```

### Delete Resources

```sh
kubectl delete -f manifests/lifecycle-check.yaml
```
