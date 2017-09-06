#!/bin/bash

sudo -E yum install -y yum-utils device-mapper-persistent-data lvm2

sudo -E yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo -E yum makecache fast

sudo -E yum install docker-ce -y

sudo systemctl start docker

sudo usermod -aG docker $USER

sudo systemctl enable docker
