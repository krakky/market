#BEFORE STARTING, step (1) -> update the configuration !!!
sudo echo '<?xml version="1.0"?>' > /etc/coopr/conf/coopr-site.xml
sudo echo '<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>' >> /etc/coopr/conf/coopr-site.xml
#--------------------------------------------------------
sudo echo '<configuration>' >> /etc/coopr/conf/coopr-site.xml
#mysql driver set
sudo echo '<!-- break line -->' >> /etc/coopr/conf/coopr-site.xml
sudo echo '<property>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <name>server.jdbc.driver</name>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <value>com.mysql.jdbc.Driver</value>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <description>Specifies DB driver</description>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '</property>' >> /etc/coopr/conf/coopr-site.xml
#mysql connection string
sudo echo '<!-- break line -->' >> /etc/coopr/conf/coopr-site.xml
sudo echo '<property>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <name>server.jdbc.connection.string</name>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <value>jdbc:mysql://127.0.0.1:3306/coopr?useLegacyDatetimeCode=false</value>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <description>Specifies DB connection string</description>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '</property>' >> /etc/coopr/conf/coopr-site.xml
#data storage USER
sudo echo '<!-- break line -->' >> /etc/coopr/conf/coopr-site.xml
sudo echo '<property>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <name>server.db.user</name>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <value>coopr</value>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <description>DB user</description>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '</property>' >> /etc/coopr/conf/coopr-site.xml
#data storage PASS
sudo echo '<!-- break line -->' >> /etc/coopr/conf/coopr-site.xml
sudo echo '<property>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <name>server.db.password</name>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <value>extraHARDpass</value>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '  <description>DB user</description>' >> /etc/coopr/conf/coopr-site.xml
sudo echo '</property>' >> /etc/coopr/conf/coopr-site.xml
#--------------------------------------------------------
sudo echo '</configuration>' >> /etc/coopr/conf/coopr-site.xml

sudo echo "Default configuration file /etc/coopr/conf/coopr-site.xml has been successfully configured !"