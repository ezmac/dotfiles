#!/bin/bash


set -x
source installerCommon.sh
prepWorkingDir "gh"

githubDownloadLatestRelease "cli" "cli" 'gh_.*amd64.deb'

sudo dpkg -i $(basename $latest_version)
