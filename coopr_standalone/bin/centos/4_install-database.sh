#Download and add the MySQL database
echo "Installing MySQL server !"
sudo yum install mysql mysql-server -y
echo "Installing Java adapter for MySQL !"
sudo yum install mysql-connector-java* -y


#IMPORTANT STUFF - both centos and ubuntu
sudo cp /usr/share/java/mysql-connector-java.jar /opt/coopr/server/lib/
sudo chmod 755 /opt/coopr/server/lib/mysql-connector-java.jar