#!/bin/bash 

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
