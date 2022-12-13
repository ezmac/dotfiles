#!/bin/bash

source installerCommon.sh

#version=2.5.1
# https://github.com/ringcentral/ringcentral-embeddable-electron-app/releases/download/v0.1.6/RingCentral-Embeddable-0.1.6.AppImage

githubDownloadLatestReleaseBin "ringcentral" "ringcentral-embeddable-electron-app" "RingCentral-Embeddable-0.*.AppImage" "ringcentral.app"
