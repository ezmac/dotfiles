#!/bin/bash 

set -eu
source installerCommon.sh

#sudo apt-get install gconf2-common libgconf-2-4 gconf-service "libc++-7-dev" "libc++1" libdbusmenu-gtk4 libappindicator1

dpkg_install https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.13653_amd64.deb teams teams.deb
