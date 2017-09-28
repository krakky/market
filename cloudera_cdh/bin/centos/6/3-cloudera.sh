echo "Ensure MySQL server starts at boot"
sudo /sbin/chkconfig mysqld on
sudo /sbin/chkconfig --list mysqld
echo "Starting MySQL server"
sudo service mysqld start