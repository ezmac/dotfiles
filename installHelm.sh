#!/bin/bash


source installerCommon.sh
if [[ $PLATFORM == "osx" ]]; then 

  brew install helm
else
  prepInstallDir "helm"

  export HELM_INSTALL_DIR=$PWD
  export USE_SUDO=false
  export VERIFY_SIGNATURES=true
  ln -sf $PWD/helm $install_base/helm

  # Recommended install method. 
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh

fi
# This repo is public when checked 2023-09-13
helm plugin install https://github.com/dronedeploy/helm-gsm.git --version v0.4.2
