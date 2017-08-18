#!/bin/sh
SUPERVISORCTL_OUTPUT=$(which supervisorctl)

if [ "$SUPERVISORCTL_OUTPUT" = "/usr/bin/supervisorctl" ]; then
    echo "<SUPERVISOR> is already installed !"
else
    echo "<SUPERVISOR> has not been found ! We are trying to install it right now !"
    sudo apt-get install supervisor -y --force-yes
fi


echo "Configuring an app within <SUPERVISOR> called <minio-cluster> !"
#---------------------------------------------------------------------
sudo echo "[program:minio-cluster]" > /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "command=bash -c '~/minio server http://$1/minio_data http://$2/minio_data http://$3/minio_data http://$4/minio_data --config-dir /etc/minio/config'" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "directory=/root/" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "autostart=true" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "autorestart=true" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "startretries=3" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "stderr_logfile=/var/log/minio/minio-cluster.err.log" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "stdout_logfile=/var/log/minio/minio-cluster.out.log" >> /etc/supervisor/conf.d/minio-cluster.conf
sudo echo "user=root" >> /etc/supervisor/conf.d/minio-cluster.conf


echo "Supervisor configuration file [/etc/supervisor/conf.d/minio-cluster.conf] for app <minio-cluster> was updated !"
sudo supervisorctl reread
sudo supervisorctl update
echo "<SUPERVISIOR> configuration for app <minio-cluster> has been set and UPDATED !"
#sudo minio server ~/minio_data --config-dir /etc/minio/config &&
supervisorctl restart minio-cluster