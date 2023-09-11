#!/bin/bash

source installerCommon.sh
lts_version=$GLOBAL_NODE_VERSION

if [[ $PLATFORM == "osx" ]]; then 
  brew install nodenv
else

  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  cd ~/.nodenv && src/configure && make -C src
  export PATH="$HOME/.nodenv/bin:$PATH"
  export eval $(nodenv init)
  git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
fi
nodenv install $lts_version
nodenv global $lts_version
