
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


let g:LanguageClient_autoStop = 0
let g:LanguageClient_loggingFile = expand('/tmp/languageclient.log')
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658'],
    \ 'yaml.ansible': ['node', '$HOME/apps/yaml-language-server/out/server/src/server.js', '--stdio'],
    \ 'python': ['/Users/tad/.pyenv/shims/pyls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
