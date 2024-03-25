#!/bin/bash
#source osDetection.sh

## 156 without ramdisk ./installVim.sh  156.30s user 22.34s system 119% cpu 2:29.20 total
## 156 with ramdisk..  ./installVim.sh  156.35s user 22.50s system 119% cpu 2:29.92 total
set -ex
zshversion=5.6.2
# assumes apt based system
# Props to valloric https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#this gist for python3
# https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8
echo "This needs sudo cause it messes with apt-get"
# yodl needed for zsh documentation build /sigh
sudo apt-get install -y yodl
sudo apt-get remove zsh-common


cd ~
if [[ ! -d "~/installers/zsh" ]]; then
  mkdir -p ~/installers/zsh
  sudo ~/dotfiles/ramdisk.sh mount ~/installers/zsh
  cd ~/installers/zsh
  git clone https://github.com/zsh-users/zsh.git .
  cd ..
fi
cd zsh
git pull origin master
git checkout zsh-$zshversion # (i want this version!)

# https://github.com/zsh-users/zsh/blob/zsh-5.6.2/INSTALL#L44
./Util/preconfig
./configure --prefix=/usr
make
make check

# --ftrans may allow building the package without actually installing
sudo checkinstall -y --pkgrelease $zshversion --pkgversion $zshversion --pkgname zsh --provides "$zshversion, zsh-common" --requires "dpkg \(\>= 1.17.14\), libc6 \(\>= 2.15\), libcap2 \(\>= 1:2.10\), libtinfo5, libc6 \(\>= 2.23\), libncursesw5, libpcre3" --nodoc -D make install

echo "I don't have time to debug, but look in ~/installers/zsh/ for the deb file if you need it"

#http://www.astarix.co.uk/2014/02/easily-exclude-packages-apt-get-upgrades/
# Prevent automated dpkg operations from clobbering this package
#echo "vim hold" |sudo dpkg --set-selections
#sudo ~/dotfiles/ramdisk.sh umount ~/installers/zsh
