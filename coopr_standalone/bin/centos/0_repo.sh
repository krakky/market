#pre-quisite SUDO
yum install sudo -y
#Install curl, in any case
echo "Making sure <CURL> is installed !"
sudo yum install curl -y

#Download Cask Yum repo file
echo "Downloading Cask repo definition file !"
sudo curl -o /etc/yum.repos.d/coopr.repo http://repository.cask.co/centos/6/x86_64/coopr/0.9/coopr.repo

#Add the Cask public GPG Key to your repository
echo "Adding Cask GPG Key to your REPOSITORY !"
sudo rpm --import http://repository.cask.co/centos/6/x86_64/coopr/0.9/pubkey.gpg