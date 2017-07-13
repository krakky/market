#set JAVA_HOME
echo "Exporting JAVA_HOME path after JAVA's JRE 1.7 was installed !"
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
sudo echo "export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64" >> /etc/environment

sudo echo "Saving JAVA_HOME variable so it doesn't get affected from system REBOOT !"
sudo echo ''\#\!/bin/sh'' > /etc/profile.d/jdk_home.sh
sudo echo "export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64" >> /etc/profile.d/jdk_home.sh
sudo echo ''export PATH=\$PATH:\$JAVA_HOME/bin'' >> /etc/profile.d/jdk_home.sh
sudo chmod 775 /etc/profile.d/jdk_home.sh