#!/bin/bash

apt update -y
apt install docker.io docker-compose git -y

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

mkdir -p /opt/cloudops
