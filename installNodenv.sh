#!/bin/bash

lts_version=12.16.1


git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
export PATH="$HOME/.nodenv/bin:$PATH"
export eval $(nodenv init)
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
nodenv install $lts_version
nodenv global $lts_version
