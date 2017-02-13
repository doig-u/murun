#!/bin/bash
set -ex

timedatectl set-timezone Europe/Moscow

apt-get update
apt-get install -y ntp ufw

# ufw
ufw disable
ufw --force reset
ufw allow "OpenSSH"
ufw default deny incoming
ufw default allow outgoing
ufw --force enable