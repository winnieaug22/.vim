" ifdef level (toggle)
let g:ifdeflevel_is_open = 0

function! IfdeflevelToggle()
    let a:current_filename = expand( '%:p' )
    let a:log_filename = '/home/winnie/.vim/plugin/winnie'
    let a:perl_filename = '/home/winnie/.vim/plugin/ifdef_level.pl'

    if g:ifdeflevel_is_open
        silent execute "bd ".a:log_filename
        silent execute "! rm ".a:log_filename
        let g:ifdeflevel_is_open = 0
    else
        silent execute "! perl ".a:perl_filename." ".a:current_filename." ".a:log_filename
        silent execute "30vsplit ".a:log_filename
        execute "normal gg=G"
        execute ":w"
        let g:ifdeflevel_is_open = 1
    endif
endfunction

