#!/bin/bash

echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║                         .: CLEANING UP PACKAGES :.                           ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
sudo rm /etc/ssh/ssh_host_*
sudo truncate -s 0 /etc/machine-id
sudo apt-get -y autoremove --purge
sudo apt-get -y clean
sudo apt-get -y autoclean
sudo sync

echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║                       .: INSTALLING NEW PACKAGES :.                          ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo apt-get -y install \
apt-transport-https \
ca-certificates \
software-properties-common \
unattended-upgrades \
gnupg-agent \
curl \
htop \
ncdu \
tmux \
wget
