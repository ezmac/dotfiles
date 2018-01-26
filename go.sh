#!/bin/bash

echo "This script requires sudo because it uses apt-get to install things."

mkdir installers -p

sudo apt-get update
sudo apt-get install -y git automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev curl cmake php zsh
#install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install nodenv
./installNodenv.sh
#install rbenv
./installRbenv.sh
./installPowerlineFont.sh
./installVim.sh
./linkDotfiles.sh
./installNeobundle.sh
./installFZF.sh

# it's easy to tell if you're in a gui by the presence of the display env var used by X;
# I'm not sure wayland uses it though
if [[ -z DISPLAY ]]; then
  ./installDesktopSoftware.sh
fi
