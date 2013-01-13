call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

au VimResized * :wincmd =
set number
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
