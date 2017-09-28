# Installing Cloudera Manager Daemons and Coudera Manager Server
echo "Installing Cloudera Manager Daemons"
sudo yum install cloudera-manager-daemons -y
sudo yum install cloudera-manager-server -y

echo "export JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera" >> /etc/default/cloudera-scm-server