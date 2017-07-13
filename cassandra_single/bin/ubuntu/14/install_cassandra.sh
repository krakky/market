echo "Adding CASSANDRA official aptitude keys and doing other magic stuff !"
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
echo "deb http://www.apache.org/dist/cassandra/debian 36x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
sudo apt-get update
echo "Intsall CASSANDRA and auto-start it !"
sudo apt-get install cassandra -y