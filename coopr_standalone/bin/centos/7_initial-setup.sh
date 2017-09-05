echo "Starting COOPR components: <SERVER>, <PROVISIONER> & <UI> !"
sudo /etc/init.d/coopr-server start
sudo /etc/init.d/coopr-provisioner start
sudo /etc/init.d/coopr-ui start

echo "Registering some additional plugins to the COOPR instantiated SERVER !"
sudo COOPR_SERVER_URI=http://127.0.0.1:55054 /opt/coopr/provisioner/bin/setup.sh
sudo COOPR_SERVER_URI=http://127.0.0.1:55054 /opt/coopr/server/templates/bin/load-templates.sh