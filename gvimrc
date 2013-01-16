set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=m
set guioptions-=r

colors gentooish

if has("gui_macvim")
    set guifont=Monaco:h12
    set fuoptions=maxvert,maxhorz
elseif has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 14
endif
