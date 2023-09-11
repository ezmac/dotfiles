#!/bin/bash

source installerCommon.sh

# AWS CLI might be the straw that breaks the camel's back.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install --bin-dir $install_base --install-dir $local_base/aws
