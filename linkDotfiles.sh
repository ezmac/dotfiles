#!/bin/bash
ln -s -f `pwd`/.vimrc ~/.vimrc
ln -s -f `pwd`/.zshrc ~/.zshrc
ln -s -f `pwd`/ezmac.zsh-theme ~/.oh-my-zsh/themes/
ln -s -f `pwd`/.tmux.conf ~/.tmux.conf
ln -s -f `pwd`/.inputrc ~/.inputrc
ln -s -f `pwd`/prompt_randomizer.js ~/.prompt_randomizer.js
ln -s -f `pwd`/yamllint_config ~/.config/yamllint/config

## GUI tools
mkdir -p ~/.config/awesome/
ln -s -f `pwd`/rc.lua ~/.config/awesome/
mkdir -p ~/.config/terminator/
ln -s -f `pwd`/terminator_config ~/.config/terminator/config


