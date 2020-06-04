#!/bin/bash


set -x
source installerCommon.sh
prepWorkingDir "bat"

githubDownloadLatestRelease "sharkdp" "bat" 'bat_.*amd64.deb'

sudo dpkg -i $(basename $latest_version)
