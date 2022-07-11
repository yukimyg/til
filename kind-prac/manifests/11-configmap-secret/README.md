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

#### test-str-scrt

```sh
kubectl apply -f test-str-scrt.yaml
kc get secret/test-str-scrt -o yaml
```

#### Delete Resources

```sh
kubectl delete -f test-scrt.yaml
kubectl delete -f test-str-scrt.yaml
```

---

#### with Volume

```sh
kubectl apply -f volume-test.yaml
```

check they are mounted.  

```sh
kubectl exec volume-test -- ls /config
kubectl exec volume-test -- cat /config/temp.txt
kubectl exec volume-test -- cat /config/HOGEHOGE
kubectl exec volume-test -- ls -l /etc/secrets 
kubectl exec volume-test -- ls -l /etc/secrets/creds/
kubectl exec volume-test -- cat /etc/secrets/creds/secret.txt
kubectl exec volume-test -- ls -l /secrets 
kubectl exec volume-test -- cat /secrets/password
kubectl exec volume-test -- cat /secrets/credential.txt
```

Delete Resources

```sh
kubectl delete -f volume-test.yaml
```

