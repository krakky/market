# Installing Cloudera Manager PostgreSQL Database
echo "Installing Cloudera Manager Database"
sudo apt-get install cloudera-manager-server-db-2 -y

# Start Cloudera Manager Database
sudo service cloudera-scm-server-db start