#!/bin/sh
echo "Installing <NTP> mechanism to update clocks !"
sudo apt-get update --fix-missing
sudo apt-get install ntp -y

sudo service ntp stop
echo "Updating internal clock and according offset(slipage) !"
sudo ntpd -gq
sudo service ntp start
echo "The clock has been synchornised via <NTP> !"


echo "============================================"