# 05 Volume

## Overview

[Kubernetes道場 5日目 - Volumeについて](https://cstoku.dev/posts/2018/k8sdojo-05/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---

### Deploy Resources

```sh
kubectl apply -f date-tail-empdir.yaml
```

### Check containers settings

```sh
kubectl exec -it date-tail -c date -- ls /var/log/date-tail
kubectl exec -it date-tail -c tail -- ls /var/log/date-tail
kubectl logs date-tail -c tail -f --tail=10
```

replace pods and check dates

```sh
kubectl replace --force -f date-tail-empdir.yaml
kubectl logs date-tail -c tail -f
```

### Delete Resources

```sh
kubectl delete -f date-tail-empdir.yaml
```

---

### Deploy Resources

```sh
kubectl apply -f date-tail-hostpath.yaml
```

### Check containers settings

```sh
kubectl exec -it date-tail -c date -- ls /var/log/date-tail
kubectl exec -it date-tail -c tail -- ls /var/log/date-tail
kubectl logs date-tail -c tail -f --tail=10
```

replace pods and check dates

```sh
kubectl replace --force -f date-tail-hostpath.yaml
kubectl logs date-tail -c tail -f
```

### Delete Resources

```sh
kubectl delete -f date-tail-hostpath.yaml
```
