#!/bin/bash

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
export PATH="$HOME/.nodenv/bin:$PATH"
export eval $(nodenv init)
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
nodenv install 9.4.0
nodenv global 9.4.0
