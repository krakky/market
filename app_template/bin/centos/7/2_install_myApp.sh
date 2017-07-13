echo "Initiating installation for myApp !"
sudo yum install myApp -y
sudo usermod -aG fooUser fooGroup

mkdir /etc/myApp
echo '{' > /etc/myApp/example.json
echo '    "foo": "example"' >> /etc/docker/example.json
echo '}' >> /etc/docker/daemon.json

sudo systemctl start myApp

echo "Starting myApp."
