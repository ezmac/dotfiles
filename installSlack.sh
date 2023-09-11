#!/bin/bash
# Slack doesn't provide a nice way to do this.
source installerCommon.sh

SLACK_VERSION=${SLACK_VERSION:-4.33.90}

sudo apt-get install -y libappindicator3-1 libindicator3-7

             #https://downloads.slack-edge.com/releases/linux/4.33.90/prod/x64/slack-desktop-4.33.90-amd64.deb
dpkg_install https://downloads.slack-edge.com/releases/linux/${SLACK_VERSION}/prod/x64/slack-desktop-${SLACK_VERSION}-amd64.deb slack slack-$SLACK_VERSION.deb
