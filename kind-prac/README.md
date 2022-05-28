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
```sh
kind create cluster --config kind.yaml
kubectl get node
```
