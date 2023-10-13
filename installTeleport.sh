#!/bin/bash
set -euo pipefail


TELEPORT_VERSION=14.0.1
source installerCommon.sh
if [[ $PLATFORM == "osx" ]]; then 

  brew install teleport
else
  prepWorkingDir "teleport"
  TELEPORT_FILENAME="teleport-v$TELEPORT_VERSION-linux-$ARCH-bin.tar.gz"
  URL="https://get.gravitational.com/${TELEPORT_FILENAME}"
  if [[ ! -f $TELEPORT_FILENAME ]]; then 
    curl -L $URL -o ${TELEPORT_FILENAME}
  fi
  TMP_CHECKSUM="${TELEPORT_FILENAME}.sha256"
  curl "${URL}.sha256" > "$TMP_CHECKSUM"
  sha256sum -c "$TMP_CHECKSUM"
  tar xf ${TELEPORT_FILENAME}
  mkdir -p $local_base/teleport/$TELEPORT_VERSION/
  for cmd in "tsh" "teleport" "tctl" ; do
    mv teleport/$cmd $local_base/teleport/$TELEPORT_VERSION/
    ln -sf $local_base/teleport/$TELEPORT_VERSION/$cmd $install_base/
  done
fi
