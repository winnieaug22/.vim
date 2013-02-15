call pathogen#runtime_append_all_bundles()

au VimResized * :wincmd =
filetype plugin on
set fileencodings=utf-8,cp950,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso-2022-jp,iso8859-1,ucs-bom
set termencoding=utf-8
set encoding=utf-8
set softtabstop=4
set shiftwidth=4
set tabstop=4
set nocompatible
set expandtab " Use spaces instead of tabs
set nolist
set hlsearch
set number
set wildmenu
set t_Co=256
set visualbell
set background=dark
set fileformat=unix
set fileformats=unix
set backspace=2
colorscheme gentooish
syntax on
" go to last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" for Powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'

" tab mapping
map td :tabclose<CR>
map th :tabprev<CR>
map tl :tabnext<CR>
map tm :tabmove
map tn :tabedit 
"remove all white space
nmap ,dw :%s/\s\+$//g<CR>
" make <Backspace> act as <Delete> in Visual mode
vmap <bs> x
" edit hex
nmap <silent> <C-H> :%!xxd<CR>
nmap <silent> <C-J> :%!xxd -r<CR>
" automatically open and close the popup menu / preview window
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" Highlight Whitespace. Remember ',dw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

autocmd Filetype c,cpp set foldmethod=syntax

" highlight doxygen syntax
autocmd Filetype c     set syntax=c.doxygen
autocmd Filetype cpp   set syntax=cpp.doxygen
autocmd Filetype java  set syntax=java.doxygen

autocmd Filetype java setlocal omnifunc=javacomplete#Complete

set dict+=/usr/share/dict/american-english
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author="Wen-Chi Guo"
let g:snips_email="campbellmath@gmail.com"
let g:DoxygenToolkit_authorName=g:snips_author.' <'.g:snips_email.'>'
