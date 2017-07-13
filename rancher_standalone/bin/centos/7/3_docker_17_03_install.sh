echo "Initiating installation for <DOCKER.v17.03> !"
sudo yum install docker-ce -y
sudo usermod -aG docker acm




#CentOS 7 - OverlayFS - FIX !!! IMPORTANT !!!
echo "Fixing <DOCKER> daemon.json configuration file for the <storage-driver> as <overlayfs> !"
sudo systemctl stop docker


mkdir /etc/docker
echo '{' > /etc/docker/daemon.json
echo '    "storage-driver": "overlay"' >> /etc/docker/daemon.json
echo '}' >> /etc/docker/daemon.json

sudo systemctl start docker

echo "Restarting <DOCKER> daemon !"