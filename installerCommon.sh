
# Used to share common functionality across installers
source settings.sh

install_base="$HOME/.local/bin"

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
  fileName=`githubDownloadLatestRelease "$1" "$2" "$3" "$4"`
  ln -sf $PWD/$fileName $install_base/$fileName
  chmod +x $PWD/$fileName
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
  





