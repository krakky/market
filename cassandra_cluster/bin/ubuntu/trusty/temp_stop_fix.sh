echo "Temporarily stopping CASSANDRA service !"
sudo service cassandra stop

#UBUNTU TRYOUT FIX
echo "Fixing file [/etc/security/limits.d/cassandra.conf], changing HARD limits to SOFT ones !"
sudo sed -i "s|cassandra  -|cassandra soft|g" /etc/security/limits.d/cassandra.conf
sudo sed -i "s|8096|32768|g" /etc/security/limits.d/cassandra.conf
#UBUNTU TRYOUT FIX

echo "Cleaning up the CASSANDRA system config and data on the created storage !"
sudo rm -rf /var/lib/cassandra/data/system/*


echo "Granting root priviledges on some of the cassandra folders to avoid any errors !"
sudo chown -R cassandra /var/lib/cassandra
sudo chown -R cassandra /var/log/cassandra