highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

function!  Coloring(group,guibg,guifg,gui)
  let highlightstr = 'highlight ' . a:group . ' '
  let highlightstr .= 'guibg=' . a:guibg . ' '
  let highlightstr .= 'guifg=' . a:guifg . ' '
  let highlightstr .= 'gui=' . a:gui . ' '

  execute histring
endfunction

" call Coloring("Comment", "NONE", "#009900", "NONE")


" ------------------------------------------
" Tree-Sitter
hi @variable guifg=NONE

hi @function guifg=#0087d7
hi @function.call guifg=#0087d7
hi @operator guifg=#d75f00
hi @keyword.operator guifg=#d75f00
"
hi @property guifg=#d78700
hi @field guifg=#afd787
hi @method guifg=#d75f00
hi @method.call guifg=#ff6666
hi @parameter guifg=#ff6666
"
hi @keyword guifg=#ff6666
hi @keyword.function guifg=#ff6666
hi @exception guifg=#ff6666
"
hi @statement guifg=#d75f00
hi @special guifg=#d78700
hi @include guifg=#ff6666
hi @type guifg=#d7af5f
hi @type.builtin guifg=#afd787
hi @punctuation.bracket guifg=#afd7af
"
hi @constructor guifg=#d78700
hi @namespace guifg=#d78700
"
hi @string guifg=#00afaf
hi @number guifg=#00afaf
hi @boolean guifg=#00afaf
"
hi @tag guifg=#d78700

" Gitsigns
hi GitSignsAdd guifg=#00ff00 guibg=NONE
hi GitSignsChange guifg=#ff8700 guibg=NONE
hi GitSignsDelete guifg=#ff0000 guibg=NONE
hi GitSignsDelete guifg=#ff0000 guibg=NONE
hi GitSignsChange guifg=#ff8700 guibg=NONE

" Hop highlight setting
hi HopNextKey guifg=#ff8000
hi HopNextKey1 guifg=#ff8000
hi HopNextKey2 guifg=#ff8000
hi HopUnmatched guifg=#4e4e4e

" ------------------------------------------

" Background
hi Normal guibg=NONE guifg=#c0c0c0 gui=NONE

" Comment
hi Comment guibg=NONE guifg=#5faf5f gui=italic
" hi Comment guibg=NONE guifg=#6c6c6c gui=italic

" Cursor Line
hi Cursor guifg=#ffffd7  guibg=#0087d7 gui=NONE
hi CursorLineNr guifg=#5fd7d7 guibg=NONE gui=BOLD
hi CursorLine guifg=NONE guibg=NONE gui=BOLD

" hi Cursor ctermfg=230 ctermbg=32 cterm=NONE
" hi CursorLineNr ctermfg=80 ctermbg=NONE cterm=BOLD
" hi CursorLine ctermfg=NONE ctermbg=NONE cterm=BOLD

" String
hi String guibg=NONE guifg=#ff8000  guibg=NONE

" Text
hi NonText guifg=#949494 guibg=NONE gui=BOLD

" Visual
hi Visual guibg=#000087 guifg=NONE gui=reverse


hi SpecialKey guifg=#949494 guibg=#303030 gui=BOLD
hi SpellBad guifg=61 guibg=NONE gui=underline
hi SpellCap guifg=#5f5faf guibg=NONE gui=underline
hi SpellLocal guifg=#af8700 guibg=NONE gui=underline
hi SpellRare guifg=#00afaf guibg=NONE gui=underline
hi Title guifg=#d75f00 guibg=NONE gui=BOLD
hi FoldColumn guifg=fg guibg=NONE gui=NONE
hi Folded guifg=#dadada guibg=NONE gui=BOLD
hi LineNr guifg=#767676 guibg=NONE gui=NONE
hi Terminal guifg=fg guibg=NONE gui=NONE
hi DiffAdd guifg=#87af00 guibg=#303030 gui=NONE
hi DiffChange guifg=#87af00 guibg=#303030 gui=NONE
hi DiffDelete guifg=#d70000 guibg=#303030 gui=BOLD
hi DiffText guifg=#0087d7 guibg=#303030 gui=NONE
hi StatusLine guifg=NONE guibg=NONE gui=NONE
hi StatusLineNC guifg=NONE guibg=NONE gui=NONE
hi TabLine guifg=#767676 guibg=NONE gui=NONE
hi TabLineFill guifg=NONE guibg=NONE gui=NONE
hi TabLineSel guifg=#9e9e9e guibg=NONE gui=BOLD
hi VertSplit guifg=#6c6c6c guibg=NONE gui=NONE
hi ColorColumn guifg=NONE guibg=#303030 gui=NONE
hi Conceal guifg=#0087d7 guibg=NONE gui=NONE
hi CursorColumn guifg=NONE guibg=#585858 gui=NONE
hi Directory guifg=#0087d7 guibg=NONE gui=NONE
hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE
hi ErrorMsg guifg=#d70000 guibg=#ffffd7 gui=reverse
hi Search guifg=#0087af guibg=#c0c0c0 gui=reverse
hi IncSearch guifg=#800080 guibg=#c0c0c0 gui=reverse
hi CurSearch guifg=#800080 guibg=#c0c0c0 gui=reverse
hi MatchParen guifg=#ffffd7 guibg=#303030 gui=BOLD
hi ModeMsg guifg=#008787 guibg=NONE gui=NONE
hi MoreMsg guifg=#008787 guibg=NONE gui=NONE
hi Pmenu guifg=#bcbcbc guibg=NONE gui=NONE
hi PmenuSbar guifg=NONE guibg=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#4e4e4e gui=NONE
hi PmenuThumb guifg=NONE guibg=#767676 gui=NONE
hi Question guifg=#00afaf guibg=NONE gui=BOLD
hi SignColumn guifg=#9e9e9e guibg=NONE gui=NONE
"
"
hi VisualNOS guifg=NONE guibg=#303030 gui=reverse
hi WarningMsg guifg=#d75f00 guibg=NONE gui=BOLD
hi WildMenu guifg=#ffffd7 guibg=#303030 gui=reverse
"
hi Constant guifg=#00afaf guibg=NONE gui=NONE
hi Error guifg=#d70000 guibg=#ffffd7 gui=BOLD,reverse
hi Identifier guifg=#0087d7 guibg=NONE gui=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE
hi PreProc guifg=#d75f00 guibg=NONE gui=NONE
hi Special guifg=#d75f00 guibg=NONE gui=NONE
hi Statement guifg=#d75f00 guibg=NONE gui=NONE
hi Todo guifg=#d70087 guibg=NONE gui=BOLD
hi Type guifg=#af8700 guibg=NONE gui=NONE
hi Underlined guifg=#5f5faf guibg=NONE gui=NONE
hi CursorIM guifg=NONE guibg=fg gui=NONE
hi ToolbarLine guifg=NONE guibg=#303030 gui=NONE
hi ToolbarButton guifg=#e4e4e4 guibg=#303030 gui=BOLD
hi NormalMode guifg=#9e9e9e guibg=#ffffd7 gui=reverse
hi InsertMode guifg=#00afaf guibg=#ffffd7 gui=reverse
hi ReplaceMode guifg=#d75f00 guibg=#ffffd7 gui=reverse
hi VisualMode guifg=#d70087 guibg=#ffffd7 gui=reverse
hi CommandMode guifg=#d70087 guibg=#ffffd7 gui=reverse
hi TermCursorNC guifg=#262626 guibg=#767676 gui=NONE
hi GitGutterAdd    guifg=#87af00
hi GitGutterChange guifg=#af8700
hi GitGutterDelete guifg=#d70000














