#!/bin/bash

echo "Haven't put much time into this.."

source installerCommon.sh

if [[ $PLATFORM != "osx" ]]; then 
  echo "Not OSX! Not installing"
  exit 1
fi
brew install koekeishiya/formulae/yabai
# prepWorkingDir "yabai"
#githubDownloadLatestRelease "koekeishiya" "yabai" "yabai.*gz"

#tar xf yabai*.gz
touch ~/.yabairc
chmod +x ~/.yabairc
