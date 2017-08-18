sudo sed -i "s/port .*/port 7000/g" /etc/redis/redis.conf
sudo sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" /etc/redis/redis.conf
sudo sed -i "s/appendonly .*/appendonly yes/g" /etc/redis/redis.conf
sudo sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" /etc/redis/redis.conf
sudo sed -i "s/# cluster-node-timeout 5000/cluster-node-timeout 5000/g" /etc/redis/redis.conf
sudo sed -i "s/# cluster-config-file nodes-6379.conf/cluster-config-file nodes.conf/g" /etc/redis/redis.conf
sudo sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf