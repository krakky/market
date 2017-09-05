#Install curl, in any case
echo "Installing curl"
sudo apt-get install curl -y

#Download Cask Yum repo file
echo "Downloading Cask repo definition file"
sudo curl -o /etc/apt/sources.list.d/coopr.list http://repository.cask.co/ubuntu/precise/amd64/coopr/0.9/coopr.list

#Add the Cask public GPG Key to your repository
echo "Adding GPG Key to your repo"
sudo curl -s http://repository.cask.co/ubuntu/precise/amd64/coopr/0.9/pubkey.gpg | sudo apt-key add -