" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/flazz/vim-colorschemes'
colorscheme molokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/gregsexton/gitv.git'
Plug 'https://github.com/rdolgushin/gitignore.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 704
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/vim-scripts/VisIncr.git'
Plug 'https://github.com/Twinside/vim-cuteErrorMarker.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
Plug 'https://github.com/vim-scripts/tComment.git'
Plug 'https://github.com/jdevera/vim-stl-syntax.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/dantler/vim-alternate.git'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/easymotion/vim-easymotion'
map  go <Plug>(easymotion-bd-w)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/sukima/xmledit.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DirDiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/vim-scripts/DirDiff.vim'
let g:DirDiffExcludes = ".git"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/vim-scripts/TaskList.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/mhinz/vim-signify'
let g:signify_disable_by_default = 0
" set g:signify_update_on_bufenter to 0, if you often switch between buffers.
let g:signify_update_on_bufenter = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/vim-utils/vim-man'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/Yggdroot/indentLine'
autocmd! User indentLine doautocmd indentLine Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/chrisbra/vim-diff-enhanced'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 800
Plug 'https://github.com/vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 800
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/campbellmath/vim-vp4'
autocmd VimEnter * command! P4opened call fzf#run(fzf#vim#with_preview({
\ 'source':  "p4opened | perl -ne 'print if /vol/' | sed 's/\t//g'",
\ 'options': ['-m',
\             '--header-lines',
\             !empty(expand('%')),
\             '--prompt',
\             'p4 opened> '
\            ],
\ 'sink':    'e'
\}))

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)

endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 800
Plug 'https://github.com/majutsushi/tagbar'
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin=trim(system('which ctags'))
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 800
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" misc
"   coc-calc
"   coc-translator
"   coc-spell-checker
" highlight
"   coc-highlight
" snippet
"   coc-snippets
" shell script
"   coc-sh
" C/C++
"   coc-clangd
"   coc-cmake
"   coc-clang-format-style-options
" Python
"   coc-pyright
" Javascript
"   coc-html
"   coc-tsserver
"   coc-json
" Mrkdown
"   coc-markdownlint

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" NOTE: do NOT use `nore` mappings
" coc-translator
" popup
nmap T <Plug>(coc-translator-p)
vmap T <Plug>(coc-translator-pv)

" replace
nmap R <Plug>(coc-translator-r)
vmap R <Plug>(coc-translator-rv)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>

endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 800
Plug 'https://github.com/voldikss/vim-floaterm'
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_width  = 0.8
let g:floaterm_height = 0.8
let g:floaterm_autoclose = 1
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
let windows=has("win32") || has("win64")
au VimResized * :wincmd =
filetype plugin on
filetype indent on
syntax on
" set 7 lines to the cursor - when moving vertically using j/k
" set so=7
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
" set termguicolors
set noeb
set vb
set viminfo='100,<100,s100,h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 801
    set ttymouse=sgr
    set balloondelay=250
    set ballooneval
    set balloonevalterm
endif
if version >= 800
    set diffopt+=internal,algorithm:patience,indent-heuristic
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set novisualbell
if version >= 801
    set belloff=
endif
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
if version >= 801
    set norelativenumber
endif
syntax sync minlines=256
autocmd BufEnter * :syn sync maxlines=500
set showmatch
set matchtime=5
if &diff
"   set diffopt+=iwhite
    set cursorline
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
autocmd Filetype c,cpp,python set foldmethod=indent
autocmd Filetype c     set syntax=c.doxygen
autocmd Filetype cpp   set syntax=cpp.doxygen

if windows
    autocmd Filetype c,cpp set tags+=$VIM/vimfiles/tags/stl_tags
    set dict+=$VIM/vimfiles/dict/words
else
    set shell=/bin/bash
    autocmd Filetype c,cpp set tags+=$HOME/.vim/tags/stl_tags
    set dict+=$HOME/.vim/dict/words
endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest ",preview
if windows
    set directory=$TMP
end
set lazyredraw
if !has('nvim')
    set clipboard=exclude:.*
endif
set tags=tags;
