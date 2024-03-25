#!/bin/bash
ghuser=so-fancy
ghrepo=diff-so-fancy

source installerCommon.sh
set -x
prepWorkingDir jp
githubDownloadLatestReleaseBin $ghuser $ghrepo "diff-so-fancy" "diff-so-fancy"

chmod +x $HOME/.local/bin/diff-so-fancy
git config --global core.pager "diff-so-fancy |less --tabs=1,4 -RFX"

