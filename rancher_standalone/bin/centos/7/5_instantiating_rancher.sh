echo "Starting a docker container with the latest <STABLE> version of RANCHER on port 8080 !"
sudo docker run --name rancher-by-ACM -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
echo "Waiting some extra seconds for the <HOST> port forwarding 8080 -> 8080 to take place !"