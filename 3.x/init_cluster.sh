kubectl -n xxx-dev exec -it redis-cluster-init -- ruby redis-trib.rb create --replicas 1 $(kubectl -n xxx-dev get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')
kubectl -n xxx-dev delete pod redis-cluster-init --force --grace-period=0
kubectl -n xxx-dev create -f svc.yaml