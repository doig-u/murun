#!/bin/bash
set -ex
cd `dirname $0`

./ubuntu-upgrade.sh

# timezone
timedatectl set-timezone Europe/Moscow

# ntp
apt-get install -y ntp

# ufw
apt-get install -y ufw
ufw disable
ufw --force reset
ufw allow "OpenSSH"
ufw default deny incoming
ufw default allow outgoing
ufw --force enable