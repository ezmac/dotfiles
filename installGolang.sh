#!/bin/bash

source installerCommon.sh


# TODO: Make this a global var, look for a goenv, and use more installer common functions
version=1.19
if [[ ! -f "installers/golang/go${version}-linux-amd64.tar.gz" ]]; then 
  tarGetExtract "https://golang.org/dl/go${version}.linux-amd64.tar.gz" golang go${version}-linux-amd64.tar.gz
  set -x
  mkdir -p ~/.local/go/${version}/
  cp -r go ~/.local/go/${version}/
fi
find ~/.local/go/${version}/go/bin/ -type f -exec ln -sf {} ~/.local/bin/ \;
