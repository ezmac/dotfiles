#!/bin/bash

ghuser=jmespath
ghrepo=jp

source installerCommon.sh
set -x
prepWorkingDir jp
githubDownloadLatestReleaseBin $ghuser $ghrepo "jp-linux-amd64" "jp"

# installing JP is as simple as moving a file to the right location after getting the latest version.
# And setting execute permission

#sudo wget https://github.com/jmespath/jp/releases/download/0.1.2/jp-linux-amd64 -O /usr/local/bin/jp \
#&& sudo chmod +x /usr/local/bin/jp


