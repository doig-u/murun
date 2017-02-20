#!/bin/bash
set -ex

cd `dirname $0`

common/ubuntu-upgrade.sh
common/first-configure.sh
nginx/install.sh