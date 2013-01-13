call pathogen#runtime_append_all_bundles()

au VimResized * :wincmd =
set fileencodings=utf-8,cp950,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso-2022-jp,iso8859-1,ucs-bom
set termencoding=utf-8
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set nolist
set hlsearch
set number
set wildmenu
set t_Co=256
colorscheme gentooish
syntax on

set laststatus=2
let g:Powerline_symbols = 'unicode'

" tab mapping
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabedit 
map td :tabclose<CR>
"remove all white space
nmap ,dw :%s/\s\+$//g<CR>
" make <Backspace> act as <Delete> in Visual mode
vmap <bs> x
" edit hex
nmap <silent> <C-H> :%!xxd<CR>
nmap <silent> <C-J> :%!xxd -r<CR>
" Highlight Whitespace. Remember ',dw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
