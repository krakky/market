#Initial setup
echo "Configuring COOPR server by registering some of the pre-required plug-ins !"
sudo COOPR_SERVER_URI=http://localhost:55054 /opt/coopr/provisioner/bin/setup.sh

sudo COOPR_SERVER_URI=http://<coopr-server>:<coopr-port> /opt/coopr/server/config/defaults/load-defaults.sh