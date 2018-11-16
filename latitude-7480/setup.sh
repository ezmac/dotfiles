#!/bin/bash

# As usual, write setup scripts so I don't have to think more than once.

# on ubuntu, udev rules are in /lib/udev/rules.d and /etc/udev/rules.d/
# /etc appears to have snap rules in it, so I'm putting these in /lib/

if [ ! -f /lib/udev/rules.d/85-latitude-dock.rules ]; then
  sudo ln -s $PWD/85-latitude-dock.rules /lib/udev/rules.d/85-latitude-dock.rules
fi

ln -s $PWD/dock.sh $HOME/.local/bin/dock.sh
ln -s $PWD/undock.sh $HOME/.local/bin/undock.sh

