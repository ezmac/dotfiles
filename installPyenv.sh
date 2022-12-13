#!/bin/bash
set -e

source installerCommon.sh
sudo apt-get install -y libbz2-dev libsqlite3-dev libffi-dev

# https://github.com/pyenv/pyenv
if [[ ! -d ~/.pyenv ]]; then
  
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  cd ~/.pyenv && src/configure && make -C src
  echo "# Pyenv config ">>~/.zshrc
  export PATH="$HOME/.pyenv/bin:$PATH"
  echo 'PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
  eval "$(pyenv init --path)"
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\n$(pyenv root)/completions/pyenv.zsh\nfi' >> ~/.zshrc

else
  cd $(pyenv root)
  git pull
fi


env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $PYTHON_GLOBAL_VERSION
pyenv global $PYTHON_GLOBAL_VERSION
