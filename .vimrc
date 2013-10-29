set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-ragtag.git'
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
" ...

"Bundle 'Valloric/YouCompleteMe'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


colorscheme solarized 
set background=dark
syntax on
let mapleader=","
set term=xterm-256color
set t_ut=

 

set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set columns=82
set textwidth=78
set number
set smartindent
