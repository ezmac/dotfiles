#!/bin/bash
# https://github.com/pyenv/pyenv
if [[ ! -d "~/.pyenv" ]]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  cd ~/.pyenv && src/configure && make -C src
  echo "# Pyenv config ">>~/.zshrc
  export PATH="$HOME/.pyenv/bin:$PATH"
  echo "!!" >> ~/.zshrc
  eval $(pyenv init -)
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\n$(pyenv root)/completions/pyenv.zsh\nfi' >> ~/.zshrc

else
  cd $(pyenv root)
  git pull
fi


pyenv install 2.7.2
pyenv install 3.5.2
pyenv global 3.5.2
