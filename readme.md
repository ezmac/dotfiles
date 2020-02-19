# Ezmac's shell and desktop config

These are the files and tools I need to enjoy working on a computer, rolled up into a package.  The end goal is to be able to package it in a docker container (the porta shell project).

You're welcome to steal as much of this as you want.  A link back would be cool, but not necessary.

There are a number of unused files, but I'm sure you can figure out which ones are unused by following the entry point of the project (`go.sh`)

## Tools
 - Zsh
 - Vim
   - neobundle for plugin installation
 - tmux
 - ag
 - fzf
 - nodenv
 - rbenv
 - php
 - powerline (with fonts, or one font.)
 - terminator
 - key remapping (swap left control with left alt; capslock with escape)
 - vim keybindings on terminal
 - vim installer (compiles with +ruby +lua) allowing ruby based vim plugins currently in my bundle
   - vim installer currently has issues staying installed with dpkg updates running. 

## TODO
 - run fresh tests
 - move installer git clones to installer directory for a cleanable install
 - options
 - immutablilty
 - python
   - I'm adding awscli-login to my normal flow and that means using python3.  Python is about to get tricky and I need something to take care of it.
 - split in to different or smaller containers if the investigation proves useful.


## manual changes
Sometimes I don't have time to automate some changes; previously I've been bad about not tracking them at all.  I'll try to do better.

### GnuPG and gnome keyring:
upstart will start gpg-agent for you.  you want to comment out the `start` line in /usr/share/upstart/sessions/gpg-agent.conf
details at: https://wiki.gnupg.org/GnomeKeyring
that does mean that starting the agent is now full manual.  Perhaps time to revisit the session thing.
