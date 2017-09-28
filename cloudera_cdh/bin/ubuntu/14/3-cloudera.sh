echo "Making sure <MySQL> starts upon appliance boot !"
sudo update-rc.d mysql defaults

echo "Starting <MySQL> with the fresh configuration !"
sudo service mysql start