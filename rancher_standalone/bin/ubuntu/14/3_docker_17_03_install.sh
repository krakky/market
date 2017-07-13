echo "Initiating installation for <DOCKER.v17.03> !"
sudo ./install_docker_17.03.sh
sudo usermod -aG docker acm
rm ./install_docker_17.03.sh