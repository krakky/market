#Initiate ReplicaSet
sudo mongo --eval "rs.initiate()"
#
#ReplicaSet Confi
sudo mongo --eval "rs.conf()"
#
#Add Hosts
for var in "$@"
do
sudo mongo --eval "rs.add(\"$var\")"
done