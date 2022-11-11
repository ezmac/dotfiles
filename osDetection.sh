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




