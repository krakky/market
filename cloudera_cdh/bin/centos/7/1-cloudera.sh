#1 - <curl> command unknown
echo "Making sure <CURL> & <WGET> module is already installed !"
sudo yum install wget -y
sudo yum install curl -y
#2 - <nc> command unknown
echo "Making sure <nc> module exists !"
sudo yum install nc -y

#3 - LXC nodes <tar> command unknown
echo "Making sure <tar> module exists !"
sudo yum install tar -y

#4 - Python version verify, <bc>
echo "Making sure <bc> module exists !"
sudo yum install bc -y


echo "Installing MySQL"
sudo wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el6-5.noarch.rpm
sudo yum update -y
sudo yum install mysql-server -y
sudo service start mysqld

echo "MySQL installation completed !!!"