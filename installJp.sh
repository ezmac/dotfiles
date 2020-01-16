#!/bin/bash

ghuser=jmespath
ghrepo=jp


# installing JP is as simple as moving a file to the right location after getting the latest version.
# And setting execute permission

#sudo wget https://github.com/jmespath/jp/releases/download/0.1.2/jp-linux-amd64 -O /usr/local/bin/jp \
#&& sudo chmod +x /usr/local/bin/jp


WORKDIR=$PWD
source $WORKDIR/latestRelease.sh
latest_version=$(latest_release "${ghuser}/${ghrepo}" "jp-linux-amd64")
echo $latest_version


wget -dO ~/.local/bin/${ghrepo} $latest_version
chmod +x ~/.local/bin/${ghrepo}
