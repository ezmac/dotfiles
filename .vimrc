set nocompatible

"change


set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" required! 

" My NeoBundles here:
"
" original repos on github
" Tim pope all up in my vimrc
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-ragtag.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
"Show git diff in vim's sign column
NeoBundle 'mhinz/vim-signify'
NeoBundle 'rstacruz/sparkup'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'godlygeek/tabular'


" Syntax checkers/linters
" Pick one of the checksyntax, jslint, or syntastic
NeoBundle 'scrooloose/syntastic'

" like zencoding
"  GOLANG
NeoBundle 'jnwhiteh/vim-golang', {'autoload':{'filetypes':['go']}}

" UNUSED but might want to work on
" has some issues in console, so disabled
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'mbbill/undotree'
" NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'mattn/gist-vim'
" NeoBundle 'elzr/vim-json'
" NeoBundle 'fholgado/minibufexpl.vim'

" syntax highlighting for Dockerfiles
NeoBundle 'ekalinin/Dockerfile.vim'


" PHP
NeoBundleLazy 'StanAngeloff/php.vim', {'autoload':{'filetypes':['php']}}
NeoBundleLazy 'shawncplus/phpcomplete.vim', {'autoload':{'filetypes':['php']}}
NeoBundle 'joonty/vdebug', {'autoload':{'filetypes':['php']}}
NeoBundleLazy 'm2mdas/phpcomplete-extended', {'autoload':{'filetypes':['php']}}

" Javascript
" NeoBundleLazy 'marijnh/tern_for_vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'moll/vim-node', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript']}}

" Coffeescript
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'maksimr/vim-jsbeautify'
" Autocomplete matched characters
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'christoomey/vim-tmux-navigator'


" Template engines
NeoBundle 'evidens/vim-twig'
NeoBundle 'xsbeats/vim-blade'

"Abolish.vim provides a simpler way. The following one command produces 48 abbreviations including all of the above.

":Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
"My current configuration has 25 Abolish commands that create hundreds of corrections my fingers refuse to learn.
"Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru) are all just 3 keystrokes away. 
"
" General Programming {

"if executable('ctags')
"  NeoBundle 'majutsushi/tagbar'
"endif
" NeoBundle 'vim-scripts/AutoTag'
NeoBundle 'groenewege/vim-less'
"NeoBundle 'spf13/PIV'
"NeoBundle 'arnaud-lb/vim-php-namespace'

NeoBundle 'altercation/vim-colors-solarized'
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
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build': {
     \     'unix': './install.sh'
     \     }
     \ }
" NeoBundle 'm2mdas/phpcomplete-extended-symfony'

" Track the engine.
NeoBundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'




NeoBundleCheck




" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<sc-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
filetype plugin indent on     " required!
set omnifunc=syntaxcomplete#Complete














hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
set ts=2 sw=2
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=2

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
set background=dark
colorscheme solarized
syntax on
let mapleader=","
set term=screen-256color
"set t_ut=
"set t_Co=256
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
"set relativenumber
set showcmd
set smartindent
set smartcase
set ignorecase
set incsearch
set hlsearch
"set foldmethod=syntax
"let php_folding=1
"set foldlevelstart=90
"set foldlevel=90
set backup
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/tmp
set history=1000
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" Vim UI {

"set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line


if has('cmdline_info')
  set ruler                   " Show the ruler
  "set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  set showcmd                 " Show partial commands in status line and
  " Selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  ""set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  "set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
"set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=0                " Lines to scroll when cursor leaves screen
"set scrolloff=3                 " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" leader slash turns off search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR> 
"Find merge conflicts
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" Plugins {

" PIV {
let g:DisableAutoPHPFolding = 0
let g:PIVAutoClose = 0
" }

" Misc {
let g:NERDShutUp=0
let b:match_ignorecase = 1
" }


" Ctags {
set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
" }

" AutoCloseTag {
" Make it so AutoCloseTag works for xml and xhtml files as well
"au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
"nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }


" NerdTree {

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
"    let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }

" }



" TagBar {
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
"}

let g:airline_powerline_fonts=1
" vim-airline {
" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
"   let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
if !exists('g:airline_theme')
  let g:airline_theme = 'solarized'
endif
if !exists('g:airline_powerline_fonts')
  " Use the default set of separators with a few customizations
  let g:airline_left_sep='›'  " Slightly fancier than '>'
  let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
" }

map <leader>n :NERDTreeToggle<CR>
let g:EasyMotion_leader_key = '<Leader><Leader>' 
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>





" Unite
"call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep,phpcomplete/files,phpcomplete/vendors,phpcomplete/extends,phpcomplete/implements','ignore_pattern', join([
      "\ '\.git/',
      "\ '.*cache/.*',
      "\ '.*logs/.*',
      "\ 'web/.*',
      "\ 'tmp',
      "\ 'library/Zend',
      "\ 'vendor'
      "\ ], '\|'))

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Disable unite for ctrlp
"nmap <C-p> :Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:! file<cr>
"
"
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

let g:phpcomplete_extended_use_default_mapping = 0




" set php specific options
let php_sql_query=1
let php_htmlInStrings=1

"autocmd FileType php call s:php_settings()
function! s:php_settings()
  "nmap <C-p> :Unite -no-split -buffer-name=files   -start-insert phpcomplete/files:!<cr>
  "setlocal omnifunc=phpcomplete_extended#CompletePHP
  setlocal omnifunc=phpcomplete_extended#CompletePHP
endfunction


let g:phpcomplete_parse_docblock_comments = 1
" Vim sessions
let g:session_autosave="no"
let g:session_autoload="yes"
let g:session_autosave_periodic=5
" let g:neocomplete#disable_auto_complete=0


let g:phpcomplete_index_composer_command='composer'
"let g:phpcomplete_extended_use_default_mapping=1

"imap <ESC>oA <ESC>ki
"imap <ESC>oB <ESC>ji
"imap <ESC>oC <ESC>li
"imap <ESC>oD <ESC>hi
" autocmd vimenter * if !argc() | NERDTree | endif

  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
  " beautify ranges
  autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
  autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
  autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


set tags=./tags;~/code


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"if exists('$TMUX')
"function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"let previous_winnr = winnr()
"silent! execute "wincmd " . a:wincmd
"if previous_winnr == winnr()
"call system("tmux select-pane -" . a:tmuxdir)
"redraw!
"endif
"endfunction
"
"let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
"
"nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
"nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
"nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
"else
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"endif
