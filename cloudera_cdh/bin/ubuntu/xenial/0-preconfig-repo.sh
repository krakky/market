#preconfig repository
sudo echo "# Packages for Cloudera Manager, Version 5, on Ubuntu 16.04 amd64" > /etc/apt/sources.list.d/cloudera-manager.list
sudo echo "deb [arch=amd64] http://archive.cloudera.com/cm5/ubuntu/xenial/amd64/cm xenial-cm5 contrib" >> /etc/apt/sources.list.d/cloudera-manager.list
sudo echo "deb-src http://archive.cloudera.com/cm5/ubuntu/xenial/amd64/cm xenial-cm5 contrib" >> /etc/apt/sources.list.d/cloudera-manager.list

#tendency to fix what's broken
sudo apt-get update -y

#pre-requisites for JAVA Oracle JDK
sudo apt-get install software-properties-common -y 
sudo add-apt-repository ppa:webupd8team/java -y

#perform GPG key verification
cd /tmp
wget https://archive.cloudera.com/cdh5/ubuntu/xenial/amd64/cdh/archive.key -O cloudera-archive.key
sudo apt-key add cloudera-archive.key

#do an update after it
sudo apt-get update -y