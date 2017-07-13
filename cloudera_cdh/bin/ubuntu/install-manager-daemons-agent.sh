# Installing Cloudera Manager Daemons and Coudera Manager Agent

echo "Installing Cloudera Manager Agent"
sudo apt-get install cloudera-manager-agent -y

echo "Installing Cloudera Manager Daemons"
sudo apt-get install cloudera-manager-daemons -y

cm=$1
sudo sed -i.bak -e"s%server_host=.*%server_host=$cm%" /etc/cloudera-scm-agent/config.ini

# Start Cloudera Manager Server
sudo service cloudera-scm-agent start