#!/bin/bash
#

source ./installerCommon.sh

set -x
gcloud_version="${GCLOUD_VERSION:-444.0.0}"
prepInstallDir gcloud


curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${gcloud_version}-linux-x86_64.tar.gz -o gcloud.tar.gz
tar xf gcloud.tar.gz
./google-cloud-sdk/install.sh --path-update true -q

# # Should be handled by path update arg.
# echo "source /home/taddd/.local/gcloud/445.0.0/google-cloud-sdk/completion.zsh.inc" >>~/.zshrc
symlinkFileToLocalBin $PWD/google-cloud-sdk/bin/gcloud gcloud

gcloud config set disable_usage_reporting true
gcloud components install gke-gcloud-auth-plugin


