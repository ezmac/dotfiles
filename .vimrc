 " Note: Skip initialization for vim-tiny or vim-small.
set nocompatible               " Be iMproved
set pythonthreedll=$HOME/.pyenv-x86_64/versions/3.11.5/lib/libpython3.so
let $PATH=$PATH . ':' . expand('/usr/local/bin/')
let $PATH=$PATH . ':' . expand($HOME.'/.local/bin/')

scriptencoding utf-8
set encoding=utf-8

"https://github.com/junegunn/vim-plug
" install if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin('~/.vim/bundle')
  " Language agnostic plugins (tools) {
    "   Git specifically
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
    "   Not git
  Plug 'scrooloose/nerdtree'
    " advanced jumping
  Plug 'Lokaltog/vim-easymotion'
    " autotoggle between absolute and relativenumver
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
    " use fzf for faster fuzzy search; requires fzf to be installed on system
  Plug 'junegunn/fzf.vim'
    " Async Lint Engine
  Plug 'w0rp/ale'
  Plug 'towolf/vim-helm'
  " Plug 'MattesGroeger/vim-bookmarks'
  Plug 'fatih/vim-go'
  Plug 'hashivim/vim-terraform'
  Plug 'vim-syntastic/syntastic'
  "Plug 'juliosueiras/vim-terraform-completion'
  " }
" Plug 'autozimu/LanguageClient-neovim', {
"   \ 'branch': 'next',
"   \ 'do': 'bash install.sh',
"   \ }

  Plug 'm-kat/aws-vim'

" let g:LanguageClient_autoStop = 0
" let g:LanguageClient_loggingFile = expand('/tmp/languageclient.log')
" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_serverCommands = {
"     \ 'ruby': ['tcp://localhost:7658'],
"     \ 'ansible': ['node', '$HOME/apps/yaml-language-server/out/server/src/server.js', '--stdio'],
"     \ 'python': ['/home/tad/.pyenv/shims/pyls']
"     \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" autocmd FileType ansible setlocal omnifunc=LanguageClient#complete
" autocmd FileType python setlocal omnifunc=LanguageClient#complete



 Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}



let g:coc_node_path="$HOME/.nodenv/shims/node"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K for show documentation in preview window
"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

  source ~/.vim.conf.d/syntax.vim
  source ~/.vim.conf.d/python.vim

"  source ~/.vim.conf.d/ruby.vim
"  source ~/.vim.conf.d/ansible.vim
"  source ~/.vim.conf.d/php.vim
"  source ~/.vim.conf.d/completor.vim
"  source ~/.vim.conf.d/youcompleteme.vim

  " Bling (visual-ish only) {
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    "Show git diff in vim's sign column
  Plug 'mhinz/vim-signify'
  " }

  " language/tool specific {
  " }

  " Java debugging plugin for gradle {
  " Not currently working, so disabled
  "Plug 'Dica-Developer/vim-jdb'
  " }


  " Below are unorganized plugins.  At some point, I should switch to a newer
  " plugin manager.

  "
  " Tim pope all up in my vimrc {

  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-abolish'
  " }


  Plug 'editorconfig/editorconfig-vim'
  " Plug 'rstacruz/sparkup'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'

  "Plug 'godlygeek/tabular'
  Plug 'jplaut/vim-arduino-ino'

  " Syntax checkers/linters
  " Pick one of the checksyntax, jslint, or syntastic
  "Plug 'scrooloose/syntastic'

  "  GOLANG
  Plug 'jnwhiteh/vim-golang', {'autoload':{'filetypes':['go']}}


  " syntax highlighting for Dockerfiles
  Plug 'ekalinin/Dockerfile.vim'

  "Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }





  " UNUSED but might want to work on

  " has some issues in console, so disabled
  " Plug 'nathanaelkane/vim-indent-guides'
  "
  " Plug 'kien/ctrlp.vim'
  " Plug 'mbbill/undotree'
  " Plug 'scrooloose/nerdcommenter'
  " Plug 'mattn/webapi-vim'
  " Plug 'mattn/gist-vim'
  " Plug 'elzr/vim-json'
  " Plug 'fholgado/minibufexpl.vim'






  " Javascript
  "NeoBundleLazy 'marijnh/tern_for_vim', {'autoload':{'filetypes':['javascript']}}
  Plug 'moll/vim-node',{'for': 'javascript'}
  " NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
  "NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript']}}


  " Ruby
  "






  " Coffeescript
  "Plug 'kchmck/vim-coffee-script'
  " Plug 'maksimr/vim-jsbeautify'
  " Autocomplete matched characters
  " Plug 'Raimondi/delimitMate'
  " Plug 'christoomey/vim-tmux-navigator'


  " Template engines
  "Plug 'evidens/vim-twig'
  "Plug 'xsbeats/vim-blade'

  "Abolish.vim provides a simpler way. The following one command produces 48 abbreviations including all of the above.

  ":Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
  "My current configuration has 25 Abolish commands that create hundreds of corrections my fingers refuse to learn.
  "Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru) are all just 3 keystrokes away. 
  "
  " General Programming {

  "if executable('ctags')
  Plug 'majutsushi/tagbar'
  "endif
  " Plug 'vim-scripts/AutoTag'
  "Plug 'groenewege/vim-less'
  Plug 'altercation/vim-colors-solarized'
  "Plug 'Shougo/unite.vim'
  "Plug 'Shougo/unite-outline'
  "Plug 'Shougo/unite-help'
  "Plug 'Shougo/unite-session'
  "Plug 'thinca/vim-unite-history'
  "Plug 'mileszs/ack.vim'
  "Plug 'Shougo/neocomplete.vim'
  " Track the engine.
"  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
"  Plug 'honza/vim-snippets'
"  let g:completor_python_binary = '/usr/bin/python'

  Plug 'andrewstuart/vim-kubernetes'
  "Plug 'SirVer/ultisnips'

  Plug 'honza/vim-snippets'



call plug#end()

filetype plugin indent on     " required!

" Minimal Configuration for terraform-completion


" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 0

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
" end Minimal Configuration for terraform-completion


"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-tab>"
" let g:UltiSnipsJumpBackwardTrigger="<sc-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"set completefunc=youcompleteme#Complete
"set omnifunc=youcompleteme#OmniComplete


" Set up tabs for easier use.
set showtabline=2
map <c-t> <Esc>:tabnew<CR>:NERDTree<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>

" TODO: either get tabguides working or remove
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
" NOTE: comments after Plug command are not allowed..
"let g:airline_powerline_fonts = 1
set background=dark
silent! colorscheme solarized
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
  " The easiest way is add %{coc#status()} to your 'statusline' option.
  set statusline+=%{coc#status()} " coc status
  "
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
set listchars=tab:\ \ \ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
"set splitbelow                  " Puts new split windows to the bottom of the current
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

" Misc {
let g:NERDShutUp=0
let b:match_ignorecase = 1
" }


" Ctags {

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
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
"    let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }

" }



" TagBar {
" TODO: install tagbar
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
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

nnoremap <leader>n :NERDTreeToggle<CR>
let g:EasyMotion_leader_key = '<Leader><Leader>' 




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

"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Disable unite for ctrlp
"nmap <C-s-p> :Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:! file<cr>
"
"
"nnoremap <leader>w :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <C-y> :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
  " Play nice with supertab
  "let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  "nmap <buffer> <ESC> <Plug>(unite_exit)
"
"endfunction





" set php specific options
let php_sql_query=1
let php_htmlInStrings=1
"let g:phpcomplete_extended_use_default_mapping = 1

"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
"autocmd FileType php call s:php_settings()
"function! s:php_settings()
"  setlocal omnifunc=phpcomplete_extended#CompletePHP
"endfunction

let g:phpcomplete_parse_docblock_comments = 1
"let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_index_composer_command= 'composer'


autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP











" PIV {
let php_folding=0
let g:DisableAutoPHPFolding = 1
let g:PIVAutoClose = 0
" }

let g:tagbar_phpctags_memory_limit='512M'

"Let's say we're debugging a file on a remote machine, and the path is
"/home/user/scripts/myscript.php. On my machine the same script is located in
"/home/jon/php/myscript.php. I would have to set the remote and local path
"options as so: >

"    let g:vdebug_options['path_maps'] = {"/home/user/scripts": "/home/jon/php"}

" joonty/Vdebug 
    let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : '0.0.0.0',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : 'tad',
    \    "continuous_mode" : '0',
    \    "path_maps" : {'/home/vagrant/Code/':'%%'},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}


" Vim sessions
let g:session_autosave="yes"
let g:session_autoload="yes"
let g:session_autosave_periodic=5
let g:session_autosave_to=$PWD
" let g:neocomplete#disable_auto_complete=0



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


set tags=./tags


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-p> :Files<CR>
map <C-b> :Buffers<cr>

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

let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:jedi#usages_command="<leader>u"



set tags=./tags

set rtp+=~/.fzf

let g:yaml_syntax_yaml_helm = 'helm'
let g:polyglot_disabled = ['yaml']
