# Install Oracle Java version for CentOS
echo "Installing Oracle JDK"
sudo yum install oracle-j2sdk1.7 -y

# NTP necessary - for each of the nodes
sudo yum install ntp -y
sudo service ntpd start