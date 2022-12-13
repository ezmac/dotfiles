#!/bin/bash

set -e
source installerCommon.sh

sudo apt-get install -y ibus libxcb1 libgl1-mesa-glx

dpkg_install https://zoom.us/client/latest/zoom_amd64.deb zoom zoom_amd64.deb
