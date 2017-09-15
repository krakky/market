#1
echo "Adding CASSANDRA official repo 311x !"
echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

#2
echo "Adding source list CASSANDRA keys !"
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA

#3
echo "running Apt-get UPDATE before installation !"
sudo apt-get update -y

#4
echo "Intsall CASSANDRA and auto-start it !"
sudo apt-get install cassandra -y