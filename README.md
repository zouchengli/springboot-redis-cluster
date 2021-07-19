# SpringBoot-Redis-Cluster
Demo for project spring boot redis cluster  

# Deploy on kubernetes
## 3.x version
```shell
cd 3.x
sh deploy.sh
sh init_cluster.sh
```
## 5.x version
```shell
cd 5.x
sh deploy.sh
sh init_cluster.sh
```

# Deploy on docker
## 3.x version
```shell
cd 3.x/cluster
sh create.sh
```
## 5.x version
```shell
cd 5.x/cluster
sh create.sh
```

# Helm install
## 5.x version
```shell
sh helm/install.sh
```