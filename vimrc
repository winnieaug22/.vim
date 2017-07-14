execute pathogen#infect()
let windows=has("win32") || has("win64")
au VimResized * :wincmd =
filetype plugin on
filetype indent on
syntax on
" set 7 lines to the cursor - when moving vertically using j/k
set so=7
set fileencodings=utf-8,cp950,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso-2022-jp,iso8859-1,ucs-bom
set termencoding=utf-8
set encoding=utf-8
set softtabstop=4
set shiftwidth=4
set tabstop=4
set nocompatible
set expandtab " Use spaces instead of tabs
set nolist
set listchars=eol:¶,tab:┊-,extends:»,precedes:«,trail:•
set hlsearch
set number
set wildmenu
set t_Co=256
set noeb
set vb
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell
set t_vb=
set t_ut=
set tm=500
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set fileformats=unix,dos
set fileformat=unix
set backspace=2
set nowrap
set colorcolumn=80
set incsearch
set ttyfast
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
autocmd BufEnter * :syn sync maxlines=500
set showmatch
set matchtime=5
" set diffopt+=iwhite
if &diff
    colorscheme wcdiff
    let g:signify_disable_by_default = 1
else
    colorscheme molokai
endif
" go to last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" for Powerline
set laststatus=2
let g:Powerline_symbols = windows ? 'compatible' : 'unicode'
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
nmap <silent> <F3> :NERDTreeToggle<CR>
" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" for Ack/Ag
if executable('ag')
    let g:ack_use_dispatch=1
    let g:ackprg = 'ag --vimgrep'
    nmap Ack :Ack! <C-R>=expand("<cword>")<CR>
endif
" edit hex
nmap <silent> <C-H> :%!xxd<CR>
nmap <silent> <C-J> :%!xxd -r<CR>
nmap <F12> :w<CR>:make!<CR>:cw<CR>
nmap <F11> :MBEToggle<CR>
" Highlight Whitespace. Remember ',dw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set nofoldenable

" highlight doxygen syntax
autocmd Filetype c,cpp set foldmethod=indent
autocmd Filetype c     set syntax=c.doxygen
autocmd Filetype cpp   set syntax=cpp.doxygen
autocmd Filetype java  set syntax=java.doxygen
autocmd Filetype java  set foldmethod=indent
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype javascript setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
autocmd Filetype perl set foldmarker={,}
autocmd Filetype perl set foldmethod=marker

if windows
    set tags+=$VIM/vimfiles/tags/stl_tags
    set dict+=$VIM/vimfiles/dict/words
else
    set tags+=$HOME/.vim/tags/stl_tags
    set dict+=$HOME/.vim/dict/words
endif
set switchbuf+=usetab,newtab
set cscopequickfix=s-,c-,d-,i-,t-,e-
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

map csc :cs find c <C-R>=expand("<cword>")<CR>
map csd :cs find d <C-R>=expand("<cword>")<CR>
map cse :cs find e <C-R>=expand("<cword>")<CR>
map csf :cs find f <C-R>=expand("<cword>")<CR>
map csg :cs find g <C-R>=expand("<cword>")<CR>
map csi :cs find i <C-R>=expand("<cword>")<CR>
map css :cs find s <C-R>=expand("<cword>")<CR>
map cst :cs find t <C-R>=expand("<cword>")<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
" only want open MBE manually when needed
let g:miniBufExplorerAutoStart = 0
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest ",preview
if windows
    set directory=$TMP
end
set lazyredraw
set clipboard=exclude:.*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author="Wen-Chi Guo"
let g:snips_email="campbellmath@gmail.com"
let g:DoxygenToolkit_authorName=g:snips_author.' <'.g:snips_email.'>'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:slime_target = "tmux"
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:DirDiffExcludes = ".git"
let g:yankring_history_dir='$HOME/.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for workstation in Synopsys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let hostname = hostname()
if hostname == "vgss5" || hostname == "vgss6" || hostname == "vgss7" || hostname == "vgintwm118" || hostname == "vgintwm119" || hostname == "vgintwm120"
    set shell=/bin/sh
    let g:tagbar_ctags_bin="$HOME/opt/bin/ctags"
    let g:snips_author="Campbell, Kuo"
    let g:snips_email="wenchi@synopsys.com"
    let g:DoxygenToolkit_authorName=g:snips_author.' <'.g:snips_email.'>'
endif
