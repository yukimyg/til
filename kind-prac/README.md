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

For example, use [lima](https://github.com/lima-vm/lima) on macOS.  

- Install lima on your mac.
- Get example of docker from [here](https://github.com/lima-vm/lima/blob/master/examples/docker.yaml).
- Build Docker

  ```sh
  limactl start ./docker.yaml
  ```
- Check it
  
  ```sh
  docker version
  docker ps
  ```

- Delete docker after [delete cluster](#delete-cluster)

  ```sh
  limactl delete docker
  ```

### Create Cluster

Edit [kind.yaml](kind.yaml) as you like.
Reference is [here](https://kind.sigs.k8s.io/docs/user/configuration).  

```sh
kind create cluster --config kind.yaml
kubectl get node
```

### Test Cluster

Test it with [manifests](manifests/).  

### Delete Cluster

```sh
kind delete clusters kind.yaml
```
