#!/bin/bash

source installerCommon.sh

ghuser=dbeaver
ghrepo=dbeaver

#symlinkFileToLocalBin "$PWD/direnv" "direnv"
#chmod +x ~/.local/bin/direnv

version="23.3.0"

  # libtime-human-perl
prepInstallDir "dbeaver"
set -x
githubDownloadLatestReleaseTar $ghuser $ghrepo "dbeaver-ce-${version}-${PLATFORM}.gtk.x86_64-nojdk.tar.gz" "dbeaver-ce-${version}-${PLATFORM}.gtk.x86_64-nojdk.tar.gz"
symlinkFileToLocalBin "$local_base/dbeaver/dbeaver/dbeaver" "dbeaver"
