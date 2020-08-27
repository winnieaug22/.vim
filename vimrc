" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/tpope/vim-fugitive.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
    " NERDTree
    nmap <F8>  :NERDTreeFind<CR>
    nmap <F9>  :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'https://github.com/vim-scripts/SearchComplete.git'
    Plug 'https://github.com/honza/vim-snippets'
    Plug 'https://github.com/pangloss/vim-javascript.git'
    Plug 'https://github.com/jpalardy/vim-slime'
    Plug 'https://github.com/terryma/vim-expand-region.git'
    Plug 'https://github.com/sukima/xmledit.git'
    Plug 'https://github.com/vim-scripts/DirDiff.vim'
    Plug 'https://github.com/rdolgushin/gitignore.vim'
    Plug 'https://github.com/vim-scripts/TaskList.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/mhinz/vim-signify'
        nmap <F11> :SignifyToggle<CR>
        let g:signify_disable_by_default = 1
        " set g:signify_update_on_bufenter to 0, if you often switch between buffers.
        let g:signify_update_on_bufenter=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/tpope/vim-dispatch'
    Plug 'https://github.com/vim-utils/vim-man'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/Yggdroot/indentLine'
        autocmd! User indentLine doautocmd indentLine Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
    Plug 'https://github.com/chrisbra/vim-diff-enhanced'
    Plug 'https://github.com/garbas/vim-snipmate'
    Plug 'https://github.com/rhysd/vim-clang-format'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/vim-airline/vim-airline'
        " for vim-airline
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/campbellmath/vim-vp4'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/majutsushi/tagbar'
        " Tagbar
        nmap <F10> :TagbarToggle<CR>
        let g:tagbar_autofocus = 1
        let g:tagbar_ctags_bin=trim(system('which ctags'))
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/arecarn/vim-fold-cycle'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
        " Setting of LanguageClient
        set hidden
        let g:LanguageClient_autoStart=0
        let g:LanguageClient_serverCommands = {
         \ 'cpp': ['clangd', '-background-index',],
         \ }
        let g:LanguageClient_diagnosticsList="Location"
        function LC_maps()
            if has_key(g:LanguageClient_serverCommands, &filetype)
                nmap <F5> <Plug>(lcn-menu)
                " Or map each action separately
                nmap <silent> K <Plug>(lcn-hover)
                nmap <silent> gd <Plug>(lcn-definition)
                nmap <silent> rn <Plug>(lcn-rename)
                nmap <silent> ac <Plug>(lcn-code-action)
                nmap <silent> sy <Plug>(lcn-symbols)
                nmap <silent> hi <Plug>(lcn-highlight)
            endif
        endfunction

        autocmd FileType c,cpp call LC_maps()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'https://github.com/dense-analysis/ale'
        let g:airline#extensions#ale#enabled=1
        let g:ale_set_balloons=1
        let g:ale_enabled=0
        nmap <F12> :ALEToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
if version >= 801
    set ttymouse=sgr
    set balloondelay=250
    set ballooneval
    set balloonevalterm

endif
if version >= 802
    set diffopt+=internal,algorithm:patience,indent-heuristic
endif
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
" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif
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
    set cursorline
else
    colorscheme molokai
endif
" go to last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" tab mapping
map td :tabclose<CR>
map tn :tabedit
"remove all white space
nmap ,dw :%s/\s\+$//g<CR>
" make <Backspace> act as <Delete> in Visual mode
vmap <bs> x
" for Ag
if executable('ag')
    nmap Ag :Ag <C-R>=expand("<cword>")<CR>
endif
" edit hex
nmap <silent> <C-H> :%!xxd<CR>
nmap <silent> <C-J> :%!xxd -r<CR>
" switch buffer
nmap <silent> <C-P> :bp<CR>
nmap <silent> <C-N> :bn<CR>
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
    set shell=/bin/bash
    autocmd Filetype c,cpp set tags+=$HOME/.vim/tags/stl_tags
    set dict+=$HOME/.vim/dict/words
endif
" Quickfix window commands respect the switchbuf option when opening a buffer.
" set switchbuf+=usetab,newtab
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

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>1)

function! AgFzf(args, fullscreen)
    let tokens  = split(a:args)
    let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
    let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
    let command_fmt = 'ag '.ag_opts.' %s || true'
    let initial_command = printf(command_fmt, shellescape(query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:args, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction
command! -nargs=* -bang Ag call AgFzf(<q-args>, <bang>1)

autocmd VimEnter * command! P4opened call fzf#run(fzf#vim#with_preview({
\ 'source':  "p4opened -n | awk '{ print $4 }'",
\ 'options': '-m -x +s',
\ 'sink':    'e'}))

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for workstation in Synopsys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let hostname = hostname()
if hostname == "odcphy-vg-1306"
    let g:snips_author="Campbell, Kuo"
    let g:snips_email="wenchi@synopsys.com"
    let g:DoxygenToolkit_authorName=g:snips_author.' <'.g:snips_email.'>'
endif
set tags=tags;
