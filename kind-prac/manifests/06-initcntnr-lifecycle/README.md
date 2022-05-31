# 06 init Container / Lifecycle

## Overview

[Kubernetes道場 6日目 - Init Container / Lifecycleについて](https://cstoku.dev/posts/2018/k8sdojo-06/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---

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

---

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

---

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
