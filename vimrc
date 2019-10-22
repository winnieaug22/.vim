" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-scripts/VisIncr.git'
Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
Plug 'https://github.com/Twinside/vim-cuteErrorMarker.git'
Plug 'https://github.com/gregsexton/gitv.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
Plug 'https://github.com/vim-scripts/timestamp.vim.git'
Plug 'https://github.com/vim-scripts/tComment.git'
Plug 'https://github.com/jdevera/vim-stl-syntax.git'
Plug 'https://github.com/vim-scripts/pythoncomplete.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/dantler/vim-alternate.git'
Plug 'https://github.com/vim-scripts/matchit.zip.git'
Plug 'https://github.com/Lokaltog/vim-easymotion.git'
Plug 'https://github.com/vim-scripts/SearchComplete.git'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/jpalardy/vim-slime'
Plug 'https://github.com/terryma/vim-expand-region.git'
Plug 'https://github.com/sukima/xmledit.git'
Plug 'https://github.com/vim-scripts/DirDiff.vim'
Plug 'https://github.com/rdolgushin/gitignore.vim'
Plug 'https://github.com/vim-scripts/TaskList.vim'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/vim-utils/vim-man'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/chrisbra/vim-diff-enhanced'
Plug 'https://github.com/garbas/vim-snipmate'
Plug 'https://github.com/rhysd/vim-clang-format'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/campbellmath/vim-vp4'
call plug#end()
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

" for vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:Powerline_symbols = windows ? 'compatible' : 'unicode'
" tab mapping
map td :tabclose<CR>
map tn :tabedit
"remove all white space
nmap ,dw :%s/\s\+$//g<CR>
" make <Backspace> act as <Delete> in Visual mode
vmap <bs> x
let g:tagbar_autofocus = 1
" for Ag
if executable('ag')
    nmap Ag :Ag <C-R>=expand("<cword>")<CR>
endif
" edit hex
nmap <silent> <C-H> :%!xxd<CR>
nmap <silent> <C-J> :%!xxd -r<CR>
" NERDTree
nmap <F8>  :NERDTreeFind<CR>
nmap <F9>  :NERDTreeToggle<CR>
" Tagbar
nmap <F10> :TagbarToggle<CR>
nmap <F11> :MBEToggle<CR>
nmap <F12> :w<CR>:Make<CR>
nmap mru :History<CR>
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
autocmd Filetype python set foldmethod=indent

if windows
    autocmd Filetype c,cpp set tags+=$VIM/vimfiles/tags/stl_tags
    set dict+=$VIM/vimfiles/dict/words
else
    autocmd Filetype c,cpp set tags+=$HOME/.vim/tags/stl_tags
    set dict+=$HOME/.vim/dict/words
endif
set switchbuf+=usetab,newtab
set cscopequickfix=s-,c-,d-,i-,t-,e-
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
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
" vim-clang-formet setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = { "BasedOnStyle" : "Google", "IndentWidth": 4 }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf

function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
endfunction
autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

autocmd VimEnter * command! P4opened call fzf#run({
\ 'source':  "p4opened -n | awk '{ print $4 }'",
\ 'options': '-m -x +s',
\ 'sink':    'e'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat $HOME/.vim//dict/words')
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
    autocmd Filetype c,cpp set tags+=$HOME/.vim/tags/qt4_tags
    " set g:signify_update_on_bufenter to 0, if you often switch between buffers.
    let g:signify_update_on_bufenter=0
    " let g:signify_vcs_list = [ 'git' ]
endif
set tags=tags;
