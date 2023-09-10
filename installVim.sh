#!/bin/bash
#source osDetection.sh
source installerCommon.sh

# WARNING!
# if you compile vim against a pyenv managed version, you will need to use 
# PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.5 or similar
# so that you can get the shared object
# there may be other issues with management, etc, haven't checked
python_libpl=$(python3 -c 'import sysconfig; print(sysconfig.get_config_var("LIBPL"))')

## 156 without ramdisk ./installVim.sh  156.30s user 22.34s system 119% cpu 2:29.20 total
## 156 with ramdisk..  ./installVim.sh  156.35s user 22.50s system 119% cpu 2:29.92 total
set -e

# assumes apt based system
# Props to valloric https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#this gist for python3
# https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8
echo "This needs sudo cause it messes with apt-get"

# Big list of needed packages held over from past installs and stack overflow answers.
# https://stackoverflow.com/questions/11416069/compile-vim-with-clipboard-and-xterm
sudo apt-get install -y libsm-dev dbus-x11 libxt-dev libsm-dev libxpm-dev xorg-dev libx11-dev libxtst-dev python3-dev ruby-dev git ncurses-dev checkinstall python3 python3-dev

sudo apt-get remove -y --allow-change-held-packages vim vim-runtime xxd
sudo apt-get remove -y --allow-change-held-packages vim-tiny vim-common vim-gui-common vim-nox

if [[ ! -d ~/dotfiles/installers/vim ]]; then
  mkdir ~/dotfiles/installers/vim
  sudo ~/dotfiles/ramdisk.sh mount ~/dotfiles/installers/vim
  cd ~/dotfiles/installers/vim
fi


cd ~/dotfiles/installers/vim

if [[ ! -d ~/dotfiles/installers/vim/.git ]]; then
  git clone https://github.com/vim/vim.git .
fi
# git pull origin master
# I have seen cached configs break the build in odd ways.  Make sure we don't keep them around
#make distclean
make clean
set -x
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp \
            --with-python3-config-dir=$python_libpl \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope \
            --prefix=/usr
# --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
set +x
#if [[ $distro == 'Debian' ]]; then
make -j4 VIMRUNTIMEDIR=/usr/share/vim/vim90
#elif [[ $distro == 'Ubuntu' ]]; then
  #make VIMRUNTIMEDIR=/usr/local/share/vim/vim74
#fi

sudo checkinstall

echo "I don't have time to debug, but look in ~/installers/vim/ for the deb file.  install it."

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

#http://www.astarix.co.uk/2014/02/easily-exclude-packages-apt-get-upgrades/
# Prevent automated dpkg operations from clobbering this package
echo "vim hold" |sudo dpkg --set-selections
cd -
# sudo ~/dotfiles/ramdisk.sh umount ~/installers/vim
