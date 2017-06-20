#!/bin/bash
#source osDetection.sh

# assumes apt based system
# Props to valloric https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
echo "This needs sudo cause it messes with apt-get"

sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git

sudo apt-get remove -y vim vim-runtime

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
#if [[ $distro == 'Debian' ]]; then
make VIMRUNTIMEDIR=/usr/share/vim/vim80
#elif [[ $distro == 'Ubuntu' ]]; then
  make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
#fi

sudo apt-get install -y checkinstall
cd vim
sudo checkinstall

echo "I don't have time to debug, but look in ~/vim/ for the deb file.  install it."

#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
#sudo update-alternatives --set editor /usr/bin/vim
#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
#sudo update-alternatives --set vi /usr/bin/vim
