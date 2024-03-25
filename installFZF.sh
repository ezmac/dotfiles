#!/bin/bash

source osDetection.sh

if [[ $PLATFORM == "osx" ]]; then 
  brew install the_silver_searcher
  brew install ack
  brew install fzf
else
  git clone https://github.com/ggreer/the_silver_searcher.git installers/the_silver-searcher/
  cd installers/the_silver-searcher/
  ./build.sh
  sudo make install
  cd -

  # Need AG and ACK to use SACK
  # install ack; keep versions around
  ack_version=3.3.1
  set -x
  curl https://beyondgrep.com/ack-v${ack_version} -o ~/.local/bin/ack-v${ack_version}
  chmod +x ~/.local/bin/ack-v${ack_version}
  ln -sf ~/.local/bin/ack-v${ack_version} ~/.local/bin/ack

  # Currently no sack
  # https://github.com/sampson-chen/sack

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --update-rc --completion
  ln -sf ~/.fzf/bin/fzf ~/.local/bin/fzf
fi
