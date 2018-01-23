#!/bin/bash
curl -o Droid\ Sans\ Mono\ for\ Powerline.otf  https://raw.githubusercontent.com/powerline/fonts/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf
mkdir -p ~/.local/share/fonts/
mv Droid\ Sans\ Mono\ for\ Powerline.otf ~/.local/share/fonts/

fc-cache -vf ~/.fonts/

