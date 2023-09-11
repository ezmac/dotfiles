
# Used to share common functionality across installers
source settings.sh
source osDetection.sh

install_base="$HOME/.local/bin"
local_base="$HOME/.local"
installer_storage="$HOME/dotfiles/installers"

latest_release () {
  version=$(curl -s https://api.github.com/repos/$1/releases/latest \
  | grep "browser_download_url.*$2" \
  | cut -d : -f 2,3 \
  | tr -d \"
  )
  # Can't return strings in bash.  only integers.
  # Echo string, let whatever needs it pick it up.
# TODO: figure out if this is needed
# When merging osx and linux variants, this was different. the meaningful diff is an asterisk before $2.
  if [[ "$version" == "" ]]; then
    version=$(curl -s https://api.github.com/repos/$1/releases/latest \
      | grep -E "browser_download_url.$2" \
      | cut -d : -f 2,3 \
      | tr -d \"
    )
  fi
  echo $version
}





prepInstallDir(){
  mkdir -p $local_base/$1
  cd $local_base/$1
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
  fileName=`githubDownloadLatestRelease "$1" "$2" "$3" "$4"`
  ln -sf $PWD/$fileName $install_base/$fileName
  chmod +x $PWD/$fileName
}

githubDownloadLatestReleaseTar() {
  fileName=`githubDownloadLatestRelease "$1" "$2" "$3" "$4"`
  tar xf $filename
}
symlinkFileToLocalBin() {
  binary=$1
  name=$2
  ln -sf "$binary" "$install_base/$name"
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

