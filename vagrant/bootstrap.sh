#!/bin/bash

sudo useradd -s '/bin/bash' -m -p '$1$xyz$OqdKgFcvYXz.U2jb8YH/S.' user
sudo sh -c 'echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user'

if [[ "$( hostname )" == "ansible" ]]; then
  apt-add-repository ppa:ansible/ansible
  apt-get update
  apt-get install -y software-properties-common ansible
  apt-get install -y git vim htop iotop lsof nmap netcat-traditional iptraf  
  su user -c "git clone https://github.com/agmonr/Ansible /home/user/git/"
fi



