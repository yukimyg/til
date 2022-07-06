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
---

### Deploy Resources

```sh
kubectl apply -f readness.yaml
```

### Check `Readiness:`

```sh
kubectl describe po/liveness-check
```

### Check conection to Service
Connecting to containers via services
```sh
kubectl run -it --rm alpine --image alpine -- ash
```
```sh
wget -O - -T 1 readiness-check-svc
exit
```
Successfully connected.  

### Fail Liveness prove

```sh
kubectl exec liveness-check -- rm /usr/share/nginx/html/index.html
kubectl describe po/liveness-check | tail
```

### Check conection to Service
Connecting to containers via services
```sh
kubectl run -it --rm alpine --image alpine -- ash
```
```sh
wget -O - -T 1 readiness-check-svc
exit
```
Connection fails.  

### Establish a ReadinessProbe connection
create `index.html`
```sh
kubectl exec readiness-check -- sh -c 'echo ok > /usr/share/nginx/html/index.html'
```
Connecting to containers via services.  
```sh
kubectl run -it --rm alpine --image alpine -- ash
```
```sh
wget -O - -T 1 readiness-check-svc
exit
```
Successfully connected. 

### Delete Resources

```sh
kubectl delete -f readiness.yaml
```
