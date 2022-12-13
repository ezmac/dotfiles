#!/bin/bash
#source osDetection.sh
source installerCommon.sh

sudo apt-get install -y gettext
sudo apt-get remove libcarp-always-perl libnumber-bytes-human-perl 
sudo apt-get remove libpango-perl

# libtime-human-perl
prepWorkingDir "shutter"
git clone https://github.com/shutter-project/shutter.git
cd shutter
cpan -Ti Gtk3::ImageView File::Which File::Copy::Recursive XML::Simple Proc::Simple Pango Gtk3 Carp::Always Number::Bytes::Human
make prefix=$local_base install
#githubDownloadLatestReleaseTar "shutter-project" "shutter" "shutter-*.tar.gz"


