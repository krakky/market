echo "Preparing CM Server External Database"
sudo /usr/share/cmf/schema/scm_prepare_database.sh mysql cloudera_scm_db root SCALE42secretly
#sudo rm -rf /etc/cloudera-scm-server/db.mgmt.properties

# Start Cloudera Manager Server
sudo service cloudera-scm-server start