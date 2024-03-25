#!/bin/bash

source installerCommon.sh

set -x
if [[ $PLATFORM == "osx" ]]; then 
  brew install pyenv
else
  pyenv_path=$HOME/.pyenv-$(uname -m)

  # https://github.com/pyenv/pyenv
  if [[ ! -d $pyenv_path ]]; then
    sudo apt-get install -y tk-dev
    git clone https://github.com/pyenv/pyenv.git $pyenv_path
    cd $pyenv_path && src/configure && make -C src
    export PATH="$pyenv_path/bin:$PATH"
    eval "$(pyenv init --path)"
    #  If you want this to config your dotfiles..
    echo "# Pyenv config ">>~/.zshrc
    echo 'PATH="'$pyenv_path'/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\n$(pyenv root)/completions/pyenv.zsh\nfi' >> ~/.zshrc

  else
    # if already installed, update from source.
    cd $(pyenv root)
    git pull
  fi

fi

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $PYTHON_GLOBAL_VERSION
pyenv global $PYTHON_GLOBAL_VERSION

#if [[ brew --version >/dev/null ]]; then 
#aom autoconf automake bdw-gc berkeley-db brotli c-ares ca-certificates cairo cjson cmake cmocka coreutils dav1d diff-so-fancy docbook docbook-xsl erlang@22 exiftool ffmpeg flac fontconfig fortune freetype frei0r fribidi gd gdbm gdk-pixbuf geos gettext gh ghostscript giflib git git-filter-repo git-lfs glib gmp gnu-getopt gnupg gnutls go gobject-introspection graphite2 graphviz gts guile harfbuzz highway icu4c imagemagick imath irssi jansson jasper jbig2dec jpeg jpeg-turbo jpeg-xl jq kubernetes-cli lame leptonica libarchive libass libassuan libavif libb2 libbluray libde265 libevent libffi libgcrypt libgpg-error libheif libidn libidn2 libksba liblqr libnghttp2 libogg libomp libpng libpthread-stubs libraw librist librsvg libsamplerate libsndfile libsodium libsoxr libssh2 libtasn1 libtiff libtool libunistring libusb libuv libvidstab libvmaf libvorbis libvpx libx11 libxau libxcb libxdmcp libxext libxrender libyaml little-cms2 lua lynx lz4 lzo m4 mbedtls mongocli mongosh mpdecimal mtr ncurses netpbm nettle node node@16 npth nvm oniguruma opencore-amr openexr openjpeg openssl@1.1 openssl@3 opus p11-kit pango pcre pcre2 perl pinentry pipenv pixman pkg-config pstree py-spy pyenv rav1e rbenv readline rubberband ruby ruby-build rust sdl2 shared-mime-info six snappy speex sqlite srt telnet tesseract the_silver_searcher theora unbound vim watch webp wxwidgets x264 x265 xmlto xorgproto xvid xz zeromq zimg zlib zsh zsh-completions zsh-syntax-highlighting zstd google-cloud-sdk miniconda
