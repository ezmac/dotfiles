#!/bin/bash


source installerCommon.sh

tarGetExtract https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz arduino-cli

mv arduino-cli $install_base
chmod +x $install_base/arduino-cli
