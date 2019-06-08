" PHP

Plug 'mkusher/padawan.vim'
let g:padawan#composer_command = '/usr/bin/composer'
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
"NeoBundleLazy 'StanAngeloff/php.vim', {'autoload':{'filetypes':['php']}}
Plug 'shawncplus/phpcomplete.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'm2mdas/phpcomplete-extended-laravel'
Plug 'joonty/vdebug'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'vim-php/tagbar-phpctags.vim'
"NeoBundleLazy '2072/PHP-Indenting-for-VIm', {'autoload':{'filetypes':['php']}}
"NeoBundleLazy '2072/vim-syntax-for-PHP', {'autoload':{'filetypes':['php']}}
"NeoBundleLazy 'Rican7/php-doc-modded', {'autoload':{'filetypes':['php']}}
Plug 'xsbeats/vim-blade'



"NeoBundle 'paulyg/Vim-PHP-Stuff' "https://github.com/paulyg/Vim-PHP-Stuff "looks complicated
