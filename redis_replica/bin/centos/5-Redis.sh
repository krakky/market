sudo sed -i "s/appendfilename .*/appendfilename redis-staging-ao.aof/g" /etc/redis.conf
sudo sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis.conf