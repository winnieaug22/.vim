call pathogen#runtime_append_all_bundles()
au VimResized * :wincmd =
filetype plugin on
filetype indent on
set fileencodings=utf-8,cp950,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso-2022-jp,iso8859-1,ucs-bom
set termencoding=utf-8
set encoding=utf-8
set softtabstop=4
set shiftwidth=4
set tabstop=4
set nocompatible
" set expandtab " Use spaces instead of tabs
set noexpandtab
set nolist
set listchars=eol:¶,tab:┊-,extends:»,precedes:«,trail:•
set hlsearch
set number
set wildmenu
set t_Co=256
set visualbell
set background=dark
set fileformats=unix,dos
set fileformat=unix
set backspace=2
set novb
set t_ut=
set nowrap
set colorcolumn=80
set cursorline
colorscheme molokai
"colorscheme gentooish
syntax on
" go to last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" for Powerline
set laststatus=2
if has("win32")
    let g:Powerline_symbols = 'compatible'
else
    let g:Powerline_symbols = 'unicode'
endif

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
nmap <F12> :w<CR>:make!<CR>:cw<CR>
" Highlight Whitespace. Remember ',dw' to kill the tyranny of whitespace!
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd Filetype c,cpp set foldmethod=syntax
" autocmd Filetype c,cpp set foldmethod=marker

" highlight doxygen syntax
autocmd Filetype c     set syntax=c.doxygen
autocmd Filetype cpp   set syntax=cpp.doxygen
autocmd Filetype java  set syntax=java.doxygen
autocmd Filetype java  set foldmethod=syntax

autocmd Filetype java setlocal omnifunc=javacomplete#Complete

autocmd Filetype javascript setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m

autocmd Filetype perl set foldmarker={,}
autocmd Filetype perl set foldmethod=marker

if has("win32")
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
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest ",preview
if has("win32") || has("win64")
    set directory=$TMP
end
set lazyredraw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author="Winnie Chen"
let g:snips_email="winne.aug22@gmail.com"
let g:DoxygenToolkit_authorName=g:snips_author.' <'.g:snips_email.'>'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:slime_target = "tmux"
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:DirDiffExcludes = ".git"
let g:gitgutter_max_signs=999999

" for Android develop
let $CLASSPATH="/opt/Android/sdk/adt-bundle/sdk/platforms/android-19/android.jar".':'.$CLASSPATH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winnie setting - function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copen - cclose (toggle)
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        silent execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" NERDTree (toggle)
let g:Nerdtree_is_open = 0

function! NerdtreeToggle()
    if g:Nerdtree_is_open
        execute ":NERDTree"
        let g:Nerdtree_is_open = 0
    else
        execute "normal q"
        let g:Nerdtree_is_open = 1
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winnie setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev ftag cs find t
cabbrev fcall cs find c
cabbrev fall vimgrep 

" Ignore case = /\cSEARCH or \Csearch
" set ignorecase

"marker: zf% ; zd ;; zo/zc zr/zm
"autocmd FileType c,cpp nested :TagbarOpen

map <leader>g :TagbarToggle<cr>
" q :mean to close Nerd tree
map <leader>n :call NerdtreeToggle()<cr>
"map ss :SrcExpl<cr><cr> "ss is copen
"map ss :SrcExplToggle
map <leader>c :set cursorcolumn!<Bar>set cursorline!<CR>
" copen - cclose (toggle)
nnoremap <leader>s :call QuickfixToggle()<cr>
nnoremap <leader>p :call IfdeflevelToggle()<cr>

" no new line(i.e. just one line)
set nowrap
colorscheme desert256
set mouse=a
" set mouse=
set nocompatible
"augroup CursorLine
"      au!
"      au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"      au WinLeave * setlocal nocursorline
"augroup END
hi Pmenu          ctermfg=252 ctermbg=235
hi PmenuSel       cterm=bold ctermfg=177 ctermbg=16
hi PmenuSbar      ctermfg=252 ctermbg=16
hi PmenuThumb     ctermfg=252 ctermbg=236
" ifdef Fold

" highlight WinnieTypeDef guibg=green 
" match WinnieTypeDef / UINT8 /

" indent when virtual mode
vmap <F10> !indent -linux --tab-size4 --no-tabs -ppi 1<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
