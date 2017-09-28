echo "Installing and settings up <MySQL> JDBC Driver !"
#BEGIN
cd /tmp
wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.43.tar.gz
tar zxvf mysql-connector-java-5.1.43.tar.gz
sudo mkdir -p /usr/share/java/
sudo cp mysql-connector-java-5.1.43/mysql-connector-java-5.1.43-bin.jar /usr/share/java/mysql-connector-java.jar
#END
sudo echo -e "create database cloudera_scm_db DEFAULT CHARACTER SET utf8;grant all on cloudera_scm_db.* TO 'root'@'%' IDENTIFIED BY 'SCALE42secretly';" | sudo mysql "--user=root" "--password=SCALE42secretly"