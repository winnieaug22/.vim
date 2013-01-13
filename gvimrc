set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=L
set guioptions-=m
set guioptions-=r
set guioptions-=R
colors gentooish
if has("gui_macvim")
    set guifont=Monaco:h12
    set fuoptions=maxvert,maxhorz
    let $PATH = "~/opt/bin:".$PATH
endif
