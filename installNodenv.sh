#!/bin/bash

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
