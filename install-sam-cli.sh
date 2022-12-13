#!/bin/bash
set -e
# Automation of this guide to installation.
# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html

curl -L -o aws-sam-cli-linux-x86_64.zip https://github.com/aws/aws-sam-cli/releases/download/v1.35.0/aws-sam-cli-linux-x86_64.zip
HASH=$(sha256sum aws-sam-cli-linux-x86_64.zip)
if [[ ! -z "${KNOWN_HASH}" ]]; then
  echo "$HASH"
  set -x
  if [ "${HASH}" != "${KNOWN_HASH}  aws-sam-cli-linux-x86_64.zip" ]; then # the double [[ vs single [ will treat the second argument as something to be escaped.
    echo "Hash check failed"
    exit 1
  fi
  set +x
else
  echo "KNOWN_HASH not given.  Will not check hash before installing"
fi
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation

sudo ./sam-installation/install
sam --version
