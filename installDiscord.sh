#!/bin/bash 

set -eu
source installerCommon.sh
# This works for old debian, but not newer debian
sudo apt-get install gconf2-common libgconf-2-4 gconf-service  "libc++1" libdbusmenu-gtk4 

prepWorkingDir discord-bs
url="https://discord.com/api/download?platform=linux&format=deb"
fileName=discord.deb

set -x
curl -L $url -o $fileName

mkdir tmpdir -p
dpkg-deb -x $fileName tempdir
dpkg-deb --control discord.deb
sudo dpkg -i discord.deb

