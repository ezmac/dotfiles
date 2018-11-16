
" vim-project is required by vim-solargraph
NeoBundle 'dbakker/vim-projectroot'

NeoBundle 'hackhowtofaq/vim-solargraph',{
      \ 'build' : {
      \     'unix': 'gem install --user-install json rest-client solargraph'
      \    },
      \  'autoload':{'filetypes':['ruby']},
      \ }
autocmd Filetype ruby,eruby setlocal omnifunc=solargraph#CompleteSolar

NeoBundleLazy 'tpope/vim-rails.git', {'autoload':{'filetypes':['ruby']}}
