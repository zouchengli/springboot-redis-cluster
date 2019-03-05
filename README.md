# SpringBoot-Redis-Cluster
Demo for project spring boot redis cluster  

# First mkdir cluster directory  
$ mkdir -p /usr/local/redis-cluster/data  
$ cd /usr/local/redis-cluster  
$ wget http://download.redis.io/releases/redis-3.2.9.tar.gz  
$ tar -zxvf redis-3.2.9.tar.gz  
$ cd redis-3.2.9  
$ make && make install  
$ vi redis.conf  
  port 9001  
  daemonize yes  
  bind 192.168.168.169 (I'm here host ip is 192.168.168.169)  
  dir /usr/local/redis-cluster/data/  
  pidfile /var/run/redis_9001.pid  
  cluster-enabled yes  
  cluster-config-file nodes-9001.conf  
  cluster-node-timeout 15000  
  appendonly yes  
  :wq (Exit vi editor)  
$ src/redis-server redis.conf  (Enter)  
$ netstat -tnlp|grep 9001  (This cmd runned you can see redis server process info)  
$ cd ..  
$ scp -r redis-cluster root@ip:/usr/local/ (Enter host password)  
$ ssh -l root ip (Enter host password)  
$ cd /usr/local/redis-cluster/data  
$ rm -rf *  
$ cd ../redis-3.2.9  
$ vi redis.conf  
  bind 192.168.168.170  (Change to current node host ip,I'm here node host ip's 192.168.168.170)  
  :wq  (Exit vi editor)  
$ src/redis-server redis.conf  (Enter)  
$ netstat -tnlp|grep 9001  (This cmd runned you can see redis server process info)  
# Loop the following operation
$ cd ..  
$ scp -r redis-cluster root@ip:/usr/local/ (Enter host password)  
$ ssh -l root ip (Enter host password)  
$ cd /usr/local/redis-cluster/data  
$ rm -rf *  
$ cd ../redis-3.2.9  
$ vi redis.conf  
  bind 192.168.168.170  (Change to current node host ip,I'm here node host ip's 192.168.168.170)  
  :wq  (Exit vi editor)  
$ src/redis-server redis.conf  (Enter)  
$ netstat -tnlp|grep 9001  (This cmd runned you can see redis server process info)  
# Loop the above operation finished later start cluster in 192.168.168.169 (My host's 192.168.168.169)
$ ssh -l root 192.168.168.169   (Enter password)
# Tip run *.rb you please install ruby plugin in server
$ /usr/local/redis-cluster/redis-3.2.9/src/redis-trib.rb create --replicas 1 192.168.168.169:9001 192.168.168.170:9001 ....
  (input yes)
