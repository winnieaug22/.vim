call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

au VimResized * :wincmd =
set number
set t_Co=256
syntax on

set laststatus=2
let g:Powerline_symbols = 'unicode'
