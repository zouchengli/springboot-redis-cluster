helm install my-redis-cluster bitnami/redis-cluster --set password=secretpassword \
 --set global.storageClass=csi-rbd-sc \
 --version 2.0.14 -n my-dev