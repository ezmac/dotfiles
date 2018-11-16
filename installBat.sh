#!/bin/bash

WORKDIR=$PWD
source $WORKDIR/latestRelease.sh
mkdir -p installers/bat
cd installers/bat
latest_version=$(latest_release 'sharkdp/bat' 'bat_.*amd64.deb')
echo $latest_version


echo $latest_version | wget -qi -
sudo dpkg -i $(basename $latest_version)

