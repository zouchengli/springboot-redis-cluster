export IP=$(ifconfig|grep eth0 -C 1|grep inet|head -n 1|awk '{print $2}')
docker-compose up -d
docker run --name initializer -d registry.cn-shanghai.aliyuncs.com/hyron/redis-initializer:3.2.12
echo "Please copy this command paste to container:"
echo "ruby redis-trib.rb create  --replicas 1 $IP:7001 $IP:7002 $IP:7003 $IP:7004 $IP:7005 $IP:7006"
echo "Finally input command: exit"
docker exec -it initializer bash
docker rm -f initializer