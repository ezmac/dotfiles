#!/bin/bash


source installerCommon.sh
prepInstallDir "yq"

ghuser=mikefarah
ghrepo=yq

githubDownloadLatestRelease $ghuser $ghrepo "yq_${PLATFORM}_${ARCH}" yq
symlinkFileToLocalBin "$PWD/yq" "yq"
chmod +x ~/.local/bin/yq
