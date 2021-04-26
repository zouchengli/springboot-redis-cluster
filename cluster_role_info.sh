for x in $(seq 0 5);
do
  echo "redis-cluster-$x";
  kubectl -n xxx-dev exec redis-cluster-$x -- redis-cli role;
  echo;
done