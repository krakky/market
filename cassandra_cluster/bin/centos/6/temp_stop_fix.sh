echo "Temporarily stopping CASSANDRA service !"
sudo service cassandra stop
echo "Cleaning up the CASSANDRA system config and data on the created storage !"
sudo rm -rf /var/lib/cassandra/data/system/*

# FIXX FOR Centos06 !!!VERY IMPORTANT!!!
echo "Fixing file [/etc/security/limits.d/cassandra.conf], changing HARD limits to SOFT ones !"
sudo sed -i "s|cassandra -|cassandra soft|g" /etc/security/limits.d/cassandra.conf
# FIXX FOR Centos06 !!!VERY IMPORTANT!!!

echo "Granting root priviledges on some of the cassandra folders to avoid any errors !"
sudo chown -R cassandra /var/lib/cassandra
sudo chown -R cassandra /var/log/cassandra