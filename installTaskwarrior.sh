#!/bin/bash

source installerCommon.sh

version=2.5.1

mkdir installers/taskwarrior/
cd installers/taskwarrior
WORKDIR=$PWD
wget -d https://taskwarrior.org/download/task-${version}.tar.gz


tar xzvf task-2.5.1.tar.gz
cd task-2.5.1
cmake -DCMAKE_BUILD_TYPE=release -CMAKE_INSTALL_PREFIX=${install_base} .

make
#sudo make install
