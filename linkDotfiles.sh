#!/bin/bash
ln -s -f `pwd`/.vimrc ~/.vimrc
ln -s -f `pwd`/.zshrc ~/.zshrc
ln -s -f `pwd`/ezmac.zsh-theme ~/.oh-my-zsh/themes/
ln -s -f `pwd`/.tmux.conf ~/.tmux.conf
ln -s -f `pwd`/.inputrc ~/.inputrc
ln -s -f `pwd`/prompt_randomizer.js ~/.prompt_randomizer.js
mkdir -p ~/.config/yamllint/
ln -s -f `pwd`/yamllint_config ~/.config/yamllint/config
ln -s -f `pwd`/.vim.conf.d ~/
ln -s -f `pwd`/history.zsh ~/.oh-my-zsh/custom/history.zsh
ln -s -f `pwd`/gpg.zsh ~/.oh-my-zsh/custom/gpg.zsh
ln -s -f `pwd`/.taskrc ~/.taskrc

## GUI tools
mkdir -p ~/.config/awesome/
ln -s -f `pwd`/rc.lua ~/.config/awesome/
mkdir -p ~/.config/terminator/
ln -s -f `pwd`/terminator_config ~/.config/terminator/config

for i in `ls custom_commands` ; do ln -s -f `pwd`/custom_commands/$i $HOME/.local/bin/ ; done

if [[ ! -f $HOME/.environmental_variables ]]; then
  # I don't want my environmental variables committed, but I would like to have a record of the ones I expect set.
  # so copy the file if it doesn't already exist so that I can at least try.
  cp `pwd`/.environmental_variables $HOME/ 
fi

