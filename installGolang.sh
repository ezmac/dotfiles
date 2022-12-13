#!/bin/bash

source installerCommon.sh

version=1.17
if [[ ! -f "installers/golang/go${version}-linux-amd64.tar.gz" ]]; then 
  tarGetExtract "https://golang.org/dl/go${version}.linux-amd64.tar.gz" golang go${version}-linux-amd64.tar.gz
  set -x
  cp -r go ~/.local/
  find ~/.local/go/bin/ -type f -exec ln -sf {} ~/.local/bin/ \;
fi
