set nocompatible               " be iMproved
filetype on
filetype plugin on

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
" Bundle 'brookhong/DBGPavim'
Bundle 'evidens/vim-twig'
Bundle 'joonty/vdebug'
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
" Let backspace go over automatic indention
set backspace=2
set grepprg=grep\ -nH\ $*
set autoindent 
set hidden
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set ruler
set columns=82
set number
set showcmd
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
map <leader>n :NERDTreeToggle<CR>
let g:EasyMotion_leader_key = '<Leader>' 
"##############################################################################                                                                         
" Easier split navigation                                                                                                                               
"##############################################################################                                                                         

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

" Move the splits arround!
nmap <silent> <c-s-k> <C-W>k                                                                                                                       
nmap <silent> <c-s-j> <C-W>j                                                                                                                       
nmap <silent> <c-s-h> <C-W>h                                                                                                                       
nmap <silent> <c-s-l> <C-W>l
