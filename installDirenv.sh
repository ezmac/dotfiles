#!/bin/bash


source installerCommon.sh
prepInstallDir "direnv"

ghuser=direnv
ghrepo=direnv

githubDownloadLatestRelease $ghuser $ghrepo "direnv.${PLATFORM}.${ARCH}" direnv
symlinkFileToLocalBin "$PWD/direnv" "direnv"
chmod +x ~/.local/bin/direnv

ensure_text_in_file ~/.zshrc 'eval "$(direnv hook zsh)"'
