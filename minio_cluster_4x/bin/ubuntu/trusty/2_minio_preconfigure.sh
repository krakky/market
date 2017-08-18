#!/bin/sh
if [ ! -d "~/minio_data" ]; then
        sudo mkdir ~/minio_data
        echo "Created main data folder for <MINIO> at /minio_data !"
fi

if [ -f "/etc/minio/config/config.json" ]; then
        echo "Configuration file already exists /etc/minio/config/config.json !"
else
        if [ ! -d "/etc/minio" ]; then
                sudo mkdir /etc/minio
        fi
        if [ ! -d "/etc/minio/config" ]; then
                sudo mkdir /etc/minio/config
        fi
        cat /tmp/minio_base_config.json | sed -e 's/REPLACEME_ACCESS_KEY/ACM-KEY/g' | sed -e 's/REPLACEME_SECRET_KEY/SCALEsecretly42/g' > /etc/minio/config/config.json
        echo "Updated <ACCESS_KEY> to <ACM-KEY> and <SECRET_KEY> to <SCALEsecretly42> ! Clearing tmp base config json file from /tmp !"
        sudo rm /tmp/minio_base_config.json
fi

if [ ! -d "/var/log/minio" ]; then
        sudo mkdir /var/log/minio
        echo "Logging path for <MINIO> [/var/log/minio/] has been successfully created !"
else
        echo "Logging path for <MINIO> already exists [/var/log/minio/] !"
fi