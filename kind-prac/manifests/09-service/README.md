# 09 Service

## Overview

[Kubernetes道場 9日目 - Serviceについて](https://cstoku.dev/posts/2018/k8sdojo-09/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

### Deploy Resources

```sh
kubectl apply -f dply-svc.yaml
```

### Check settings

```sh
kubectl get all
```

### Connect to Service using environment variables

```sh
kubectl run alpine -it --rm --image alpine -- ash
```

Run commands in the Alpine container.  

```sh
env
wget -O - $NGINX_SERVICE_HOST
```

### Connect to Service using DNS

Run commands in the Alpine container.  

```sh
nslookup nginx
wget -O - nginx
```

### Headless Service

Run commands in the Alpine container.

```sh
nslookup nginx-headless
```

exit and delete "alpine"

```sh
exit
```

### Connect to Nodeport

```sh
kubectl get svc/nginx-np
curl http://localhost:30080
```

### Delete Resources

```sh
kubectl delete -f dply-svc.yaml
```
