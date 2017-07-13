#1
echo "CentOS 7 by default has <WGET> & <CURL> modules already installed !"

#<nc> command unknown
echo "Making sure <nc> module exists !"
yum install nc -y

echo "Installing some recommended modules as prequisites for <DOCKER> storage alternatives !"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2