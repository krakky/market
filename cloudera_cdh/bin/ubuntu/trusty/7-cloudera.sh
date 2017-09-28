echo "Preparing <Cloudera Manager Main Database> targeting <MySQL> datbase named <cloudera_scm_db> !"
sudo /usr/share/cmf/schema/scm_prepare_database.sh mysql cloudera_scm_db root SCALE42secretly
sudo rm -rf /etc/cloudera-scm-server/db.mgmt.properties

# Start Cloudera Manager Server
echo "Starting <Cloudera Manager Server> accssible through port <7180>"
sudo service cloudera-scm-server start