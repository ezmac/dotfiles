#!/bin/bash

git clone https://github.com/ggreer/the_silver_searcher.git installers/the_silver-searcher/
cd installers/the_silver-searcher/
./build.sh
sudo make install
cd -


git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
