#!/bin/bash


source installerCommon.sh
prepInstallDir "argocd"

ghuser=argoproj
ghrepo=argo-cd

githubDownloadLatestRelease $ghuser $ghrepo "argocd-${PLATFORM}-${ARCH}" argocd
symlinkFileToLocalBin "$PWD/argocd" "argocd"
chmod +x ~/.local/bin/argocd
