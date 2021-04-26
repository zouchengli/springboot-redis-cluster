kubectl create -f sts.yaml
kubectl -n xxx-dev run redis-cluster-init --image=zouchengli/redis-initializer:3.2.12