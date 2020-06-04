#!/bin/bash


mkdir -p installers/arduino-cli
cd installers/arduino-cli
wget -d https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz
tar -xf arduino-cli_latest_Linux_64bit.tar.gz
chmod +x arduino-cli
mv arduino-cli ~/.local/bin/
