#!/bin/bash

# https://github.com/lastpass/lastpass-cli

sudo apt-get --no-install-recommends -yqq install \
  bash-completion \
  build-essential \
  cmake \
  libcurl3  \
  libcurl3-openssl-dev  \
  libssl1.0.0 \
  libssl-dev \
  libxml2 \
  libxml2-dev  \
  pkg-config \
  ca-certificates \
  xclip


git clone https://github.com/lastpass/lastpass-cli.git installers/lastpass-cli/
cd installers/lastpass-cli/
make
sudo make install
cd -
