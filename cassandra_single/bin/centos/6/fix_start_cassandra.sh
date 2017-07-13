#5 FIXX FOR Centos06 !!!VERY IMPORTANT!!!
echo "Fixing file [/etc/security/limits.d/cassandra.conf], changing HARD limits to SOFT ones !"
sudo sed -i "s|cassandra -|cassandra soft|g" /etc/security/limits.d/cassandra.conf


#6
echo "Starting CASSANDRA NoSQL Database Node ..."
sudo service cassandra start