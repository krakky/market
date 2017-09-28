#skip the OK and yes license
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | sudo debconf-set-selections

# Install Oracle Java version for Ubuntu
echo "Installing Oracle JDK (v.8)"
sudo apt-get install oracle-java8-installer -y

# NTP necessary - for each of the nodes
sudo apt-get install ntp -y
sudo service ntp start