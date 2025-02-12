#!/bin/bash
#
set -x
source installerCommon.sh

ln -sf $PWD/rc.lua $HOME/.config/awesome/

#Power arrow darker with mods is my jam.
prepWorkingDir "awesome-copycats"
if [[ ! -d awesome-copycats ]]; then
  git clone git@github.com:/lcpz/awesome-copycats.git --recurse-submodules
fi

cp -r awesome-copycats/* ~/.config/awesome/



# unrelated, cat whack a mole is something that would probs sell.  some servos and some cheap toys with a plastic body..  Use cams to lift, buttons under to sense a whack..  Then a dispenser if they hit it.  Arduino or esp32 controlled, who cares.
# 
