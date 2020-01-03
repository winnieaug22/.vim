set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=m
set guioptions-=r
set guioptions-=e
set visualbell

if has("gui_macvim")
    " set guifont=Monaco:h14
    set guifont=Menlo\ Regular:h12
    set fuoptions=maxvert,maxhorz
elseif has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
elseif has("gui_win32")
    set guifont=DejaVu\ Sans\ Mono:h12
    " set guifont=Consolas:h12:cANSI
    let $LANG="zh_TW.UTF-8"
    set langmenu=en_us.utf-8
    set encoding=utf8
    language messages en_us.utf-8
    "reload menu with UTF-8 encoding
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
