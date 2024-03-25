#!/bin/bash

ghuser="vscodium"
ghrepo="vscodium"
package="codium.*amd64.deb"

source installerCommon.sh

prepWorkingDir "vscodium"
set -x

file=$(githubDownloadLatestRelease $ghuser $ghrepo $package package.deb)

sudo dpkg -i $(basename $file)
