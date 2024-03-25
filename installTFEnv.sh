#!/bin/bash

source installerCommon.sh

set -x
if [[ $PLATFORM == "osx" ]]; then 
  brew install tfenv
else

  # https://github.com/pyenv/pyenv
  if [[ ! -d ~/.tfenv ]]; then
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    cd ~/.tfenv && src/configure && make -C src
    export PATH="$HOME/.tfenv/bin:$PATH"
    eval "$(tfenv init --path)"
    #  If you want this to config your dotfiles..
    echo "# tfenv config ">>~/.zshrc
    echo 'PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v tfenv 1>/dev/null 2>&1; then\n  eval "$(tfenv init -)"\n$(tfenv root)/completions/tfenv.zsh\nfi' >> ~/.zshrc

  else
    # if already installed, update from source.
    cd $(tfenv root)
    git pull
  fi

fi

tfenv install $TERRAFORM_GLOBAL_VERSION
tfenv use $TERRAFORM_GLOBAL_VERSION


# Install TFLINT
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

