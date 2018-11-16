NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build': {
     \     'unix': './install.py --js-completer'
     \     }
     \ }
set completefunc=youcompleteme#Complete
set omnifunc=youcompleteme#OmniComplete
