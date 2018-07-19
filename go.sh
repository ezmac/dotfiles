#!/bin/bash
echo "This script requires sudo because it uses apt-get to install things."

mkdir installers -p

sudo apt-get update
sudo apt-get install -y git automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev curl cmake php7.0-cli zsh python-pip
#install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install nodenv
./installNodenv.sh
#install rbenv
./installRbenv.sh
./installVim.sh
# my vimrc uses these folders, so they're important
mkdir -p ~/.vim/{backup,undo,tmp}
./linkDotfiles.sh
./installNeobundle.sh
source ~/.zshrc

export PATH="$HOME/.nodenv/versions/9.4.0/bin/:$PATH"
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
