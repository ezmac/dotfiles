#!/bin/bash

source installerCommon.sh
now=`date +%Y-%m-%d`
if [[ ! -f "installers/firefox/firefox-${now}.tar.bz2" ]]; then 

  tarGetExtract "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" firefox firefox-${now}.tar.bz2
else
  cd installers/firefox/
  tar -xf firefox-${now}.tar.bz2
fi
killall firefox || true
sleep 2
sudo mkdir -p /usr/lib/firefox-dev
sudo cp -r ~/dotfiles/installers/firefox/firefox/* /usr/lib/firefox-dev/
sudo rm /usr/bin/firefox
sudo ln -fs /usr/lib/firefox-dev/firefox /usr/bin/firefox-dev
sudo ln -fs /usr/lib/firefox-dev/firefox /usr/bin/firefox

