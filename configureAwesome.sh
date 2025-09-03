#!/bin/bash
#
source installerCommon.sh

ln -sf $PWD/rc.lua $HOME/.config/awesome/

#Power arrow darker with mods is my jam.
prepWorkingDir "awesome-copycats"
if [[ ! -d awesome-copycats ]]; then
  git clone git@github.com:/lcpz/awesome-copycats.git
fi

cp -r awesome-copycats/* ~/.config/awesome/

