#!/bin/bash
PLATFORM='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   PLATFORM='linux'
   distro=`lsb_release -si`
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   PLATFORM='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   PLATFORM='osx'
fi

# detect architecture
ARCH=""
case $(uname -m) in
   x86_64)
      ARCH="amd64"
      ;;
   i386)
      ARCH="386"
      ;;
   armv7l)
      ARCH="arm"
      ;;
   aarch64)
      ARCH="arm64"
      ;;
   **)
      echo "ERROR: Your system's architecture isn't officially supported or couldn't be determined."
      echo "Please refer to the installation guide for more information:"
      echo "https://goteleport.com/docs/installation/"
      exit 1
      ;;
esac



