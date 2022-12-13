#!/bin/bash
# Slack doesn't provide a nice way to do this.
source installerCommon.sh

SLACK_VERSION=${SLACK_VERSION:-4.17.0}

sudo apt-get install -y libappindicator3-1 libindicator3-7

dpkg_install https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb slack slack-$SLACK_VERSION.deb
