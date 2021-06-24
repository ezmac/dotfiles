#!/bin/bash -x
thunderbird_version=78.7.1
# thunderbird_version=68.9.0

source installerCommon.sh
if [[ ! -f "installers/thunderbird/thunderbird-${thunderbird_version}.tar.bz2" ]]; then 
  tarGetExtract "https://download.mozilla.org/?product=thunderbird-${thunderbird_version}-SSL&os=linux64&lang=en-US" thunderbird thunderbird-${thunderbird_version}.tar.bz2
else
  cd installers/thunderbird/
  tar -xf thunderbird-${thunderbird_version}.tar.bz2
fi
# thunderbird is installed by copying compiled binaries..
killall thunderbird-bin || true
sudo cp -r ~/dotfiles/installers/thunderbird/thunderbird/* /usr/lib/thunderbird/

