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
kubectl apply -f initcontainer-test.yaml && kubectl get po -w
```

### Check how it was done

```sh
kubectl logs initcntnr-test -c step1
kubectl logs initcntnr-test -c step2
kubectl logs initcntnr-test -c step3
kubectl logs initcntnr-test -c app1
kubectl logs initcntnr-test -c app2
```

### Delete Resources

```sh
kubectl delete -f manifests/initcntnr-test.yaml
```
