cm=$1
selfagentip=$(hostname -I)

sudo sed -i.bak -e"s%server_host=.*%server_host=$cm%" /etc/cloudera-scm-agent/config.ini
sudo sed -i "/listening_ip=/c\listening_ip=$selfagentip" /etc/cloudera-scm-agent/config.ini

# Start Cloudera Manager Server
sudo service cloudera-scm-agent restart