#!/bin/bash




set -e
source installerCommon.sh

prepWorkingDir 1password

sudo apt-get install -y gnupg2
dpkg_install https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb 1password 1password-latest.deb
