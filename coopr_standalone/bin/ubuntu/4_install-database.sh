#Download and add the database connector JAR
sudo apt-get install libmysql-java* -y

#IMPORTANT STUFF
sudo cp /usr/share/java/mysql-connector-java.jar /opt/coopr/server/lib/
sudo chmod 755 /opt/coopr/server/lib/mysql-connector-java.jar

#INSTALL MYSQL 5.6
#skip interactivity
sudo apt-get install debconf-utils -y
sudo echo 'mysql-server-5.6 mysql-server/root_password password acm42SQLpass' | sudo debconf-set-selections 
sudo echo 'mysql-server-5.6 mysql-server/root_password_again password acm42SQLpass' | sudo debconf-set-selections 

#INSTALL it 
sudo apt-get install mysql-server-5.6 -y