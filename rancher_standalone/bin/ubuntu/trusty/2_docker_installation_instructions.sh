echo "Downloading <DOCKER> environament installation steps from the RANCHER online repo !"
wget https://releases.rancher.com/install-docker/17.03.sh --output-document=install_docker_17.03.sh
sudo chmod 755 ./install_docker_17.03.sh