
NeoBundle 'dbakker/vim-projectroot'

NeoBundle 'hackhowtofaq/vim-solargraph',{
      \ 'build' : {
      \     'unix': 'gem install --user-install json rest-client solargraph'
      \    },
      \ }
autocmd Filetype ruby,eruby setlocal omnifunc=solargraph#CompleteSolar

