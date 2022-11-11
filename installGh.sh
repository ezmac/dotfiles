#!/bin/bash


set -x
source installerCommon.sh
if [[ $PLATFORM == "osx" ]]; then 

  brew remove github-release # not the same as gh
  brew install gh
else
  prepWorkingDir "gh"

  githubDownloadLatestRelease "cli" "cli" 'gh_.*amd64.deb'

  sudo dpkg -i $(basename $latest_version)
fi
