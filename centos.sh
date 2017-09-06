#!/bin/bash

sudo -E yum install -y yum-utils device-mapper-persistent-data lvm2

sudo -E yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo -E yum makecache fast

sudo -E yum install docker-ce -y

sudo systemctl start docker

sudo usermod -aG docker $USER

sudo systemctl enable docker

sudo mkdir -p /etc/systemd/system/docker.service.d

sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf

sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf << 'EOF'
[Service]
Environment="HTTP_PROXY=http://proxy.sdc.hp.com:8080/"
EOF

sudo systemctl daemon-reload

sudo systemctl restart docker

systemctl show --property=Environment docker
