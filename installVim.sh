#!/bin/bash

# assumes debian system
# Props to valloric https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git

sudo apt-get remove vim vim-runtime gvim

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74

sudo apt-get install checkinstall
cd vim
sudo checkinstall

echo "I don't have time to debug, but look in ~/vim/ for the deb file.  install it."

#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
#sudo update-alternatives --set editor /usr/bin/vim
#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
#sudo update-alternatives --set vi /usr/bin/vim
