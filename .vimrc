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
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'ervandew/supertab'
" NeoBundle 'brookhong/DBGPavim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'joonty/vdebug'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'm2mdas/phpcomplete-extended'
NeoBundle 'm2mdas/phpcomplete-extended-symfony'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundleCheck
filetype plugin indent on     " required!
set omnifunc=syntaxcomplete#Complete
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after NeoBundle command are not allowed..
"let g:airline_powerline_fonts = 1

colorscheme solarized 
set background=dark
syntax on
let mapleader=","
set term=xterm-256color
set t_ut=
set t_Co=256
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
set number
set showcmd
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch
set foldmethod=syntax
let php_folding=1
set foldlevel=2

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
map <leader>n :NERDTreeToggle<CR>
let g:EasyMotion_leader_key = '<Leader><Leader>' 
"##############################################################################                                                                         
" Easier split navigation                                                                                                                               
"##############################################################################                                                                         

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>




" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
"if exists('$TMUX')
"  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif



" Unite
call unite#custom_source("file_rec,file_rec/async,file_mru,file,buffer,grep,phpcomplete/files,phpcomplete/vendors,phpcomplete/extends,phpcomplete/implements",'ignore_pattern', join([
  \ '\.git/',
  \ '.*cache/.*',
  \ '.*logs/.*',
  \ 'web/.*',
  \ 'tmp',
  \ 'library/Zend',
  \ 'vendor'
  \ ], '\|'))
  
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nmap <C-p> :Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:! file<cr>
"nnoremap <leader>w :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <C-y> :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <C-b> :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
   let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC> <Plug>(unite_exit)
  
endfunction
" neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let php_sql_query=1
let php_htmlInStrings=1

autocmd FileType php call s:php_settings()
function! s:php_settings()
  "nmap <C-p> :Unite -no-split -buffer-name=files   -start-insert phpcomplete/files:!<cr>
  "setlocal omnifunc=phpcomplete_extended#CompletePHP
endfunction
" Vim sessions
let g:session_autosave="no"
let g:session_autosave_periodic=5
" let g:neocomplete#disable_auto_complete=1


let g:phpcomplete_index_composer_command='composer'
