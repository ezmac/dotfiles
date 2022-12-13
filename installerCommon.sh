
# Used to share common functionality across installers
source settings.sh

local_base="$HOME/.local"
install_base="$HOME/.local/bin"

installer_storage="$HOME/dotfiles/installers"

latest_release () {
  version=$(curl -s https://api.github.com/repos/$1/releases/latest \
  | grep "browser_download_url.*$2" \
  | cut -d : -f 2,3 \
  | tr -d \"
  )
  # Can't return strings in bash.  only integers.
  # Echo string, let whatever needs it pick it up.
  echo $version
}

prepWorkingDir(){
  mkdir -p installers/$1
  cd installers/$1
}
# Download the release file named the same as ghFileName unless 4th arg given.
# 4th arg useful for binary releases, but there's a helper function for that.
githubDownloadLatestRelease() {
  ghUser=$1
  ghRepo=$2
  ghFileName=$3
  latest_version=$(latest_release "${ghUser}/${ghRepo}" "${ghFileName}")
  outputFile=${4-`basename $latest_version`}
  curl -L $latest_version -o $outputFile
  echo "$outputFile"
  # chmod +x ~/.local/bin/${ghrepo}
}
githubDownloadLatestReleaseBin() {
  set -x
  fileName=`githubDownloadLatestRelease "$1" "$2" "$3" "$4"`
  ln -sf $PWD/$fileName $install_base/$fileName
  chmod +x $PWD/$fileName
  set +x
}
githubDownloadLatestReleaseTar() {
  fileName=`githubDownloadLatestRelease "$1" "$2" "$3" "$4"`
  tar xf $filename
}


# leave state in current directory instead of going back?
tarGetExtract(){
  url=$1
  installDirName=$2
  fileName=$3
  if [[ -z $fileName ]]; then
    fileName=`basename $1`
  fi
  mkdir -p installers/$installDirName
  cd installers/$installDirName
  curl -L $url -o $fileName
  tar xf $fileName
}

dpkg_install(){
  url=$1
  installDirName=$2
  fileName=$3
  if [[ -z $fileName ]]; then
    fileName=`basename $1`
  fi
  mkdir -p installers/$installDirName
  cd installers/$installDirName
  curl -L $url -o $fileName
  sudo dpkg -i $fileName

  if [[ $? != 0 ]]; then
    echo "FAILED: rolling back"
    pkg_name=`dpkg -I $fileName|grep Package|cut -f2 -d:`
    sudo dpkg --remove $pkg_name
  fi
}




