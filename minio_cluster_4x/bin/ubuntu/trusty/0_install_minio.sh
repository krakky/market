#!/bin/bash
MINIO_PATH=$(which minio)

if [ -f "~/minio" ]; then
    echo "<MINIO> is already installed !"
else
    sudo wget https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.RELEASE.2017-07-24T18-27-35Z
    sudo mv ./minio.RELEASE.2017-07-24T18-27-35Z ~/minio
    sudo chmod 755 ~/minio
fi

if [ -d "/etc/minio/config" ]; then
  echo "Configuration directory for <MINIO> is already created !"
else
  if [ ! -d "/etc/minio" ]; then
      sudo mkdir /etc/minio
  fi
  sudo mkdir /etc/minio/config
  echo "Configuration directory for <MINIO> successfully created at /etc/minio/config !"
fi