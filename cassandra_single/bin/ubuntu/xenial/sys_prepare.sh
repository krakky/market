echo "Adding support for add-apt-repository command of <apt-get> !"
sudo apt-get update -y
sudo apt-get install software-properties-common -y

#LXC container CURL - ubu 14
echo "Make sure <CURL> is there !"
sudo apt-get install curl -y
#LXC container CURL - ubu 14


#ubuntu 16 & xenial additions
sudo apt-get upgrade -y