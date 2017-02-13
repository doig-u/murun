#!/bin/bash
set -ex

apt-get update

# it is for switch off interaction when grub upgrades (possible only for Vagrant Ubuntu 16.04)
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
apt-get autoremove -y