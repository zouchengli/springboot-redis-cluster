kubectl delete -f sts.yaml
kubectl delete pvc -n xxx-dev $(kubectl get pvc -n xxx-dev|grep redis-cluster|awk '{print $1}')