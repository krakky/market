echo "Setting MySQL password"
echo -e "\ny\nSCALE42secretly\nSCALE42secretly\ny\nn\ny\ny" | sudo /usr/bin/mysql_secure_installation

echo "Installing MySQL JDBC Driver"
#sudo yum install mysql-connector-java -y
wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.43.tar.gz
tar zxvf mysql-connector-java-5.1.43.tar.gz
sudo mkdir -p /usr/share/java/
sudo cp mysql-connector-java-5.1.43/mysql-connector-java-5.1.43-bin.jar /usr/share/java/mysql-connector-java.jar

echo -e "create database cloudera_scm_db DEFAULT CHARACTER SET utf8;grant all on cloudera_scm_db.* TO 'root'@'%' IDENTIFIED BY 'SCALE42secretly';" | sudo mysql "--user=root" "--password=SCALE42secretly"