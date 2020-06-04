#!/bin/bash

source installerCommon.sh

version=2.5.1

tarGetExtract https://taskwarrior.org/download/task-${version}.tar.gz taskwarrior task-${version}.tar.gz

cd -
cd installers/taskwarrior/task-$version
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=${install_base}/.. .

make
make install
