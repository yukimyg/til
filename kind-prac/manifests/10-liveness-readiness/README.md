# 10 LivenessProbe, ReadinessProbe

## Overview

[Kubernetes道場 10日目 - LivenessProbeとReadinessProbeについて](https://cstoku.dev/posts/2018/k8sdojo-10/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---

### Deploy Resources

```sh
kubectl apply -f liveness-check.yaml
```

### Check `Liveness:`

```sh
kubectl describe po/liveness-check
```

### Fail Liveness prove

```sh
kubectl exec liveness-check -- rm /usr/share/nginx/html/index.html
kubectl describe po/liveness-check | tail
```

### Check container restart
```sh
kubectl describe po/liveness-check | tail
```

If LivenessProbe fails, the container is killed and re-created and started again.

### Delete Resources

```sh
kubectl delete -f liveness-check.yaml
```
