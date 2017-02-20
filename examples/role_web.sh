#!/bin/bash
set -ex
cd `dirname $0`

common/first-configure.sh
nginx/install.sh