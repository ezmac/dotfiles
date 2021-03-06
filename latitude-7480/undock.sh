#!/bin/bash
#!/bin/bash

logger -t dock "undock script invoked"

sudo -u tad bash -c 'DISPLAY=:0 ~/.screenlayout/laptop.sh' 2>&1 | logger -t dock
sudo -u tad bash -c 'DISPLAY=:0 xmodmap ~/dotfiles/.swapLctlLalt' 2>&1 | logger -t dock
sudo -u tad bash -c 'DISPLAY=:0 xmodmap ~/dotfiles/.swapCapsEsc' 2>&1 | logger -t dock

exit 0
