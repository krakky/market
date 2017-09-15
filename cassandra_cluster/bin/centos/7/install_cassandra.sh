echo "Expanding local repo pointers with <DATASAX> repos offering CASSANDRA 3.0 !"

#create the file
sudo echo "[datastax]" >  /etc/yum.repos.d/datastax.repo
sudo echo "name = DataStax Repo for Apache Cassandra" >> /etc/yum.repos.d/datastax.repo
sudo echo "baseurl = http://rpm.datastax.com/community" >> /etc/yum.repos.d/datastax.repo
sudo echo "enabled = 1" >> /etc/yum.repos.d/datastax.repo
sudo echo "gpgcheck = 0" >> /etc/yum.repos.d/datastax.repo


#install cassandra 3.0 latest stable for CentOS6
echo "Installation begins for CASSANDRA 3.0 !"
sudo yum install dsc30 -y

echo "Installing additional supplementary tools like <nodetool> & <cqlsh> !"
#installing cassandra supplementary tools like <nodetool> & <cqlsh> !
sudo yum install cassandra30-tools -y