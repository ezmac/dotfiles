#!/bin/bash
#

source ./installerCommon.sh
prepInstallDir kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x $PWD/kubectl
symlinkFileToLocalBin $PWD/kubectl kubectl
