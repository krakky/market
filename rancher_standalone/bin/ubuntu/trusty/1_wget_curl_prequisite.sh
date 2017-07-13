#1
echo "Making sure that <WGET> & <CURL> modules exist !"
sudo apt-get update
sudo apt-get install wget -y
sudo apt-get install curl -y

#IMPROTANT for ubuntu 14.04+
echo "Updating the kernel ! FIXX "
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install linux-image-extra-virtual -y

#extra for container
sudo modprobe overlay