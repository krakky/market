echo There are $# arguments to $0

CURRENT_IP=$1
ENTIRE_CLUSTER=$2,$3

if [ ! -z "$4" ]
then
        ENTIRE_CLUSTER=$ENTIRE_CLUSTER,$4
fi

echo "==========================================================="
echo CURRENT_IP of Cassandra node is $CURRENT_IP
echo ENTIRE_CLUSTER of the ACM-deployed-CLUSTER is $ENTIRE_CLUSTER
echo "==========================================================="

# >>> 1 <<<
echo "Assigning the cluster name to <ACM-deployed-CLUSTER> !"
sudo sed -i "s|cluster_name: 'Test Cluster'|cluster_name: 'ACM-deployed-CLUSTER'|g" /etc/cassandra/conf/cassandra.yaml

# >>> 2 <<<
echo "Assigning the <seeds> parameter with the ENTIRE_CLUSTER list !"
sudo sed -i "s|- seeds: \"127.0.0.1\"|- seeds: \"$ENTIRE_CLUSTER\"|g" /etc/cassandra/conf/cassandra.yaml

# >>> 3 <<<
echo "Changing <listen_address> parameter from LOCALHOST with the variable {{ SELF.IP }} passed argument [$CURRENT_IP] !"
sudo sed -i "s|listen_address: localhost|listen_address: $CURRENT_IP|g" /etc/cassandra/conf/cassandra.yaml

# >>> 4 <<<
echo "Changing <rpc_address> parameter from LOCALHOST with the variable {{ SELF.IP }} passed argument [$CURRENT_IP] !"
sudo sed -i "s|rpc_address: localhost|rpc_address: $CURRENT_IP|g" /etc/cassandra/conf/cassandra.yaml

# >>> 5 <<<
echo "Changing <endpoint_snitch> from <SimpleSnitch> to <GossipingPropertyFileSnitch> !"
sudo sed -i "s|endpoint_snitch: SimpleSnitch|endpoint_snitch: GossipingPropertyFileSnitch|g" /etc/cassandra/conf/cassandra.yaml

# >>> 6 <<<
echo "Appending a single YAML configuration(line) of <auto_bootstrap: true> to /etc/cassandra/conf/cassandra.yaml !"
echo "auto_bootstrap: false" >> /etc/cassandra/conf/cassandra.yaml

# >>> 7 <<<
echo "Starting CASSANDRA node as part of the ACM-deployed-CLUSTER> with its new configuration !"
sudo rm -rf /var/lib/cassandra/data/system/*
sudo service cassandra start