#!/bin/bash
#source osDetection.sh

set -e

# assumes apt based system
# Props to valloric https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#this gist for python3
# https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8
echo "This needs sudo cause it messes with apt-get"

sudo apt-get install -y python-dev ruby-dev git ncurses-dev checkinstall

sudo apt-get remove -y --allow-change-held-packages vim vim-runtime
sudo apt-get remove -y --allow-change-held-packages vim-tiny vim-common vim-gui-common vim-nox

cd ~
if [[ ! -d ~/vim ]]; then
  git clone https://github.com/vim/vim.git
fi
cd vim
git pull origin master
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr
#if [[ $distro == 'Debian' ]]; then
make VIMRUNTIMEDIR=/usr/share/vim/vim80
#elif [[ $distro == 'Ubuntu' ]]; then
  #make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
#fi

sudo checkinstall

echo "I don't have time to debug, but look in ~/vim/ for the deb file.  install it."

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

#http://www.astarix.co.uk/2014/02/easily-exclude-packages-apt-get-upgrades/
# Prevent automated dpkg operations from clobbering this package
echo "vim hold" |sudo dpkg --set-selections
