#!/bin/bash

echo "This script requires sudo because it uses apt-get to install things."

sudo apt-get update
sudo apt-get install chromium-browser
sudo apt-get install -y git
sudo apt-get remove vim-common
sudo apt-get install -y curl
sudo apt-get install -y cmake
sudo apt-get install php
sudo apt-get install php7.1
sudo apt-get install php
sudo apt-get install rbenv
sudo apt-get remove rbenv
sudo apt-get install -y zsh
#install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install nodenv
./installNodenv.sh
#install rbenv
./installRbenv.sh
./installPowerlineFont.sh
./installVim.sh
./linkDotfiles.sh
