# 11 Configmap, Secret

## Overview

[Kubernetes道場 11日目 - ConfigMap / Secretについて](https://cstoku.dev/posts/2018/k8sdojo-11/).  

## Usage

### Create Cluster

Build Docker Deamon and create Cluster as [../../README.md](../../README.md#usage)

---
Omit the method using the create command.

### Configmap

use Manifest.  

#### test-cm

```sh
kubectl apply -f test-cm.yaml
kc get configmap/test-cm -o yaml
```

#### bin-cm

 Read 20 bytes from `/dev/urandom` and encode in base64, add it to [bin-cm.yaml](bin-cm.yaml#L6)

```sh
$ head -c 20 /dev/urandom | base64
9s3MOyAYi1uyUVpsIX3AqGtnVxQ=
```

```sh
kubectl apply -f bin-cm.yaml
kc get configmap/bin-cm -o yaml
```

#### Delete Resources

```sh
kubectl delete -f test-cm.yaml
kubectl delete -f bin-cm.yaml
```

### Sercret

#### test-scrt

```sh
$ echo -n 'mypassword' | base64
bXlwYXNzd29yZA==
```

```sh
kubectl apply -f test-scrt.yaml
kc get secret/test-scrt -o yaml
```

#### Delete Resources

```sh
kubectl delete -f test-scrt.yaml
```
