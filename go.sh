#!/bin/bash

set -euo pipefail
echo "This script requires sudo because it uses apt-get to install things."

mkdir installers -p

sudo apt-get update
sudo apt-get install -y \
  automake \
  cmake \
  curl \
  git \
  liblzma-dev \
  libpcre3-dev \
  libreadline-dev \
  libssl-dev \
  pkg-config \
  zlib1g-dev \
  zsh \
  ; #don't sort me!
#install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"|| true # if it's there, I don't care.
#install nodenv
./installNodenv.sh
#don't install rbenv :'(
#./installRbenv.sh
#./installVim.sh
./installTmux.sh

# my vimrc uses these folders, so they're important
mkdir -p ~/.vim/{backup,undo,tmp}
./linkDotfiles.sh
./installNeobundle.sh
source ~/.zshrc

vim "+set nomore" +NeoBundleInstall +qall
./installFZF.sh
pip install --user yamllint




# it's easy to tell if you're in a gui by the presence of the display env var used by X;
# I'm not sure wayland uses it though
if [[ ! -z $DISPLAY ]]; then
  echo display was $DISPLAY
  ./installDesktopSoftware.sh
  ./installPowerlineFont.sh
fi
