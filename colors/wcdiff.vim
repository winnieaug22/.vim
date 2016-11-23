
" Vim colorscheme
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "wcdiff"

hi Boolean           cterm=bold         ctermfg=18      ctermbg=252
hi ColorColumn       cterm=bold         ctermfg=0       ctermbg=183
hi Comment           cterm=bold         ctermfg=244     ctermbg=252
hi Conceal           cterm=bold         ctermfg=242     ctermbg=252
hi Conditional       cterm=bold         ctermfg=18      ctermbg=252
hi Constant          cterm=bold         ctermfg=242     ctermbg=252
hi Cursor            cterm=reverse      ctermfg=16      ctermbg=252
hi CursorColumn      cterm=bold         ctermfg=NONE    ctermbg=252
hi CursorLine        cterm=bold         ctermfg=NONE    ctermbg=252
hi CursorLineNr      cterm=bold         ctermfg=247     ctermbg=252
hi DiffAdd           cterm=bold         ctermfg=NONE    ctermbg=194
hi DiffChange        cterm=bold         ctermfg=NONE    ctermbg=251
hi DiffDelete        cterm=bold         ctermfg=NONE    ctermbg=181
hi DiffText          cterm=bold         ctermfg=NONE    ctermbg=147
hi Directory         cterm=bold         ctermfg=239     ctermbg=252
hi Error             cterm=bold         ctermfg=NONE    ctermbg=224
hi ErrorMsg          cterm=bold         ctermfg=NONE    ctermbg=224
hi FoldColumn        cterm=bold         ctermfg=251     ctermbg=252
hi Folded            cterm=bold         ctermfg=247     ctermbg=252
hi Identifier        cterm=bold         ctermfg=NONE    ctermbg=252
hi Ignore            cterm=bold         ctermfg=NONE    ctermbg=252
hi IncSearch         cterm=reverse      ctermfg=16      ctermbg=120
hi LineNr            cterm=bold         ctermfg=yellow  ctermbg=darkgrey
hi MatchParen        cterm=bold         ctermfg=NONE    ctermbg=254
hi ModeMsg           cterm=bold         ctermfg=NONE    ctermbg=252
hi MoreMsg           cterm=bold         ctermfg=NONE    ctermbg=252
hi NonText           cterm=bold         ctermfg=252     ctermbg=252
hi Normal            cterm=bold         ctermfg=0       ctermbg=252
hi Number            cterm=bold         ctermfg=18      ctermbg=252
hi Pmenu             cterm=bold         ctermfg=NONE    ctermbg=230
hi PmenuSbar         cterm=bold         ctermfg=NONE    ctermbg=254
hi PmenuSel          cterm=bold         ctermfg=NONE    ctermbg=254
hi PmenuThumb        cterm=bold         ctermfg=NONE    ctermbg=253
hi PreProc           cterm=bold         ctermfg=NONE    ctermbg=252
hi Question          cterm=bold         ctermfg=NONE    ctermbg=252
hi Search            cterm=reverse      ctermfg=95      ctermbg=252
hi SignColumn        cterm=bold         ctermfg=251     ctermbg=252
hi Special           cterm=bold         ctermfg=18      ctermbg=252
hi SpecialKey        cterm=bold         ctermfg=251     ctermbg=252
hi SpellBad          cterm=undercurl    ctermfg=NONE    ctermbg=224
hi SpellCap          cterm=undercurl    ctermfg=NONE    ctermbg=252
hi SpellLocal        cterm=undercurl    ctermfg=NONE    ctermbg=194
hi SpellRare         cterm=undercurl    ctermfg=NONE    ctermbg=254
hi Statement         cterm=bold         ctermfg=18      ctermbg=252
hi StatusLine        cterm=bold         ctermfg=235     ctermbg=254
hi StatusLineNC      cterm=bold         ctermfg=247     ctermbg=254
hi StorageClass      cterm=bold         ctermfg=18      ctermbg=252
hi String            cterm=bold         ctermfg=28      ctermbg=252
hi TabLine           cterm=bold         ctermfg=247     ctermbg=254
hi TabLineFill       cterm=bold         ctermfg=NONE    ctermbg=254
hi TabLineSel        cterm=bold         ctermfg=235     ctermbg=254
hi Title             cterm=bold         ctermfg=0       ctermbg=252
hi Todo              cterm=standout     ctermfg=NONE    ctermbg=252
hi Type              cterm=bold         ctermfg=0       ctermbg=252
hi Underlined        cterm=bold         ctermfg=NONE    ctermbg=252
hi VertSplit         cterm=bold         ctermfg=254     ctermbg=252
hi Visual            cterm=bold         ctermfg=NONE    ctermbg=254
hi VisualNOS         cterm=bold         ctermfg=NONE    ctermbg=252
hi WarningMsg        cterm=bold         ctermfg=NONE    ctermbg=224
hi WildMenu          cterm=bold         ctermfg=NONE    ctermbg=252
hi lCursor           cterm=bold         ctermfg=NONE    ctermbg=252
