#!/bin/bash
set -ex
cd `dirname $0`

# Remove old nginx and configs
apt-get purge -y nginx nginx-common

# Install nginx
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests -y ca-certificates nginx

mv /etc/nginx/sites-available/default /etc/nginx/conf.d/default.conf
rm -rf /etc/nginx/sites-enabled /etc/nginx/sites-available

cp nginx.conf /etc/nginx/

# Configure firewall
if hash ufw 2>/dev/null; then
    ufw allow "Nginx Full"
fi