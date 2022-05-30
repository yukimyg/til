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
kubectl apply --record -f manifests/deploy-1.yaml
```

### Check settings

```sh
kubectl get deploy
kubectl get replicaset
kubectl get pod
```

### Rolling Update

#### pause deployment

```sh
kubectl rollout pause deploy nginx
```

#### change image

Change `spec:template:spec` of [deploy.yaml](manifests/deploy.yaml#L20).  
For example, `nhinx:alpine`.  

```sh
kubectl apply --record -f manifests/deploy-2.yaml
```

#### resume deployment

Rolling update.  

```sh
kubectl rollout resume deploy nginx && kubectl get pod -w
```

Check history of Rollout, Resources

```sh
kubectl rollout history deploy nginx
kubectl get deploy
kubectl get replicaset
kubectl get pod
```

### Rollback

```sh
kubectl rollout undo deploy nginx --to-revision 1
```

Check resources
```sh
kubectl rollout history deploy nginx
kubectl get deploy
kubectl get replicaset
kubectl get pod
```

### Delete Resources

```sh
kubectl delete -f manifests/deploy.yaml
```
