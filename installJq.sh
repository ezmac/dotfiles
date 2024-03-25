#!/bin/bash


set -x
source installerCommon.sh
prepInstallDir "jq"

githubDownloadLatestReleaseBin "jqlang" "jq" 'jq-linux-amd64' 'jq'

