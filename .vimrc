set nocompatible

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
" required! 

" My NeoBundles here:
"
" original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup'
NeoBundle 'tpope/vim-ragtag.git'
NeoBundle 'tpope/vim-rails.git'
" vim-scripts repos
" ...

"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ervandew/supertab'
" NeoBundle 'brookhong/DBGPavim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'joonty/vdebug'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'm2mdas/phpcomplete-extended'
filetype plugin indent on     " required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after NeoBundle command are not allowed..


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


nmap <F2> :mksession ~/.vim_session <cr>
nmap <F2> :source ~/.vim_session <cr>

