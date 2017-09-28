#1 - <curl> command unknown
echo "Making sure <CURL> & <WGET> module is already installed !"
sudo sudo apt-get install wget -y
sudo sudo apt-get install curl -y
#2 - <nc> command unknown
echo "Making sure <nc> module exists !"
sudo sudo apt-get install nc -y

#3 - LXC nodes <tar> command unknown
echo "Making sure <tar> module exists !"
sudo sudo apt-get install tar -y

echo "Installing MySQL(v5.7)..."
sudo echo 'mysql-server-5.7 mysql-server/root_password password SCALE42secretly' | sudo debconf-set-selections 
sudo echo 'mysql-server-5.7 mysql-server/root_password_again password SCALE42secretly' | sudo debconf-set-selections
sudo apt-get install mysql-server-5.7 -y

echo "MySQL(v5.7) installation has been successfully completed !!!"