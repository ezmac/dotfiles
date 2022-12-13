#!/bin/bash
mkdir -p $HOME/.local/bin
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy >$HOME/.local/bin/diff-so-fancy
chmod +x $HOME/.local/bin/diff-so-fancy
git config --global core.pager "diff-so-fancy |less --tabs=1,4 -RFX"
