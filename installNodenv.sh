#!/bin/bash

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
export PATH="$HOME/.nodenv/bin:$PATH"
eval $(nodenv init)
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
