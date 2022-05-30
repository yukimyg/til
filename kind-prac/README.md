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
kubectl apply -f manifests/date-tail.yaml
```

### Check containers settings

```sh
kubectl exec -it date-tail -c date -- ls /var/log/date-tail
kubectl exec -it date-tail -c tail -- ls /var/log/date-tail
kubectl logs date-tail -c tail -f --tail=10
```

replace pods and check dates
```sh
kubectl replace --force -f manifests/date-tail.yaml
kubectl logs date-tail -c tail -f
```

### Delete Resources

```sh
kubectl delete -f manifests/date-tail.yaml
```
