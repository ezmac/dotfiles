#!/bin/bash

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
export PATH="$HOME/.rbenv/bin:$PATH"
eval $(rbenv init)
git clone https://github.com/rbenv/ruby-build.git $(rbenv root)/plugins/ruby-build
