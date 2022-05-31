# 08 ReplicaSet / Deployment

## Overview

[Kubernetes道場 8日目 - ReplicaSet / Deploymentについて](https://cstoku.dev/posts/2018/k8sdojo-08/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---

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

---

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
