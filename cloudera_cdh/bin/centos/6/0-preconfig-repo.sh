#preconfig repository
sudo echo "[cloudera-manager]" > /etc/yum.repos.d/cloudera-manager.repo
sudo echo "# Packages for Cloudera Manager, Version 5, on RedHat or CentOS 6 x86_64" >> /etc/yum.repos.d/cloudera-manager.repo
sudo echo "name=Cloudera Manager" >> /etc/yum.repos.d/cloudera-manager.repo        	  
sudo echo "baseurl=https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5/" >> /etc/yum.repos.d/cloudera-manager.repo
sudo echo "gpgkey=https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/RPM-GPG-KEY-cloudera" >> /etc/yum.repos.d/cloudera-manager.repo
sudo echo "gpgcheck=1" >> /etc/yum.repos.d/cloudera-manager.repo

#do an update after it
sudo yum update -y