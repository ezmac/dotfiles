#!/bin/bash

sudo apt-get install -y chromium arandr apt-file
source installerCommon.sh
# pidgin libpurple-dev
sudo apt-get install -y  libjson-glib-dev libglib2.0-dev libprotobuf-c-dev protobuf-c-compiler git make xsel \
  network-manager-openconnect network-manager-openconnect-gnome 
./installDiscord.sh
./installFirefox.sh
./installPowerlineFont.sh
./installShutter.sh
./installSignal.sh
./installSlack.sh
#./installTeams.sh
#./installThunderbird.sh
./installZoom.sh

# git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.gitI
#mv -bv awesome-copycats/{*,.[^.]*} ~/.config/awesome; rm -rf awesome-copycats

#cd ~/.config/awesome
#cp rc.lua.template rc.lua
