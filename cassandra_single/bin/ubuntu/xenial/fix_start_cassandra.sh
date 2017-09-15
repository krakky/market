#cassandra is AUTO-STARTED with ubuntu
echo "Enabling and starting CASSANDRA service !"
sudo systemctl stop cassandra.service
sudo systemctl enable cassandra.service
sudo systemctl start cassandra.service