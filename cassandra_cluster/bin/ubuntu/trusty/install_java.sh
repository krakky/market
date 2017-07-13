echo "Updating PPA repo for Java-OpenJDK-8 !"
sudo add-apt-repository -y ppa:openjdk-r/ppa
echo "Sudo <apt-get> UPDATE again !"
sudo apt-get update
echo "Install JAVA 1.8 !"
sudo apt-get install -y openjdk-8-jdk