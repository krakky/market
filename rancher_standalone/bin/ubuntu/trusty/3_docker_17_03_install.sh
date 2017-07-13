echo "Initiating installation for <DOCKER.v17.03> !"
sudo ./install_docker_17.03.sh
sudo usermod -aG docker acm
rm ./install_docker_17.03.sh




#Ubuntu-14 LXC(container) - OverlayFS - FIX !!! IMPORTANT !!!
echo "Fixing <DOCKER> daemon.json configuration file for the <storage-driver> as <overlayfs> !"
sudo service docker stop


mkdir /etc/docker
echo '{' > /etc/docker/daemon.json
echo '    "storage-driver": "overlay"' >> /etc/docker/daemon.json
echo '}' >> /etc/docker/daemon.json

sudo service docker start

echo "Restarting <DOCKER> daemon !"