#!/bin/bash
 
ghuser=prusa3d
ghrepo=PrusaSlicer


set -x
source installerCommon.sh
prepWorkingDir "prusa"

file=$(githubDownloadLatestRelease $ghuser $ghrepo 'PrusaSlicer.*linux-x64-GTK3-.*AppImage')

rm -f $HOME/apps/Prusa*
rm -f $HOME/.local/bin/prusa
#
cp $file $HOME/apps/
chmod +x $HOME/apps/$file

ln -s $HOME/apps/$file $HOME/.local/bin/prusa

