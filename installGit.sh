#!/bin/bash
source installerCommon.sh

if [[ $PLATFORM == "osx" ]]; then 
  brew install tfenv
else

  sudo add-apt-repository -y ppa:git-core/ppa
  sudo apt-get update
  sudo apt-get install git -y
fi
