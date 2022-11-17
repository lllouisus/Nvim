highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

" ------------------------------------------

" Cmp colors & Lsp ------ ------ ------ ------ ------
hi CmpItemKind guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemMenu guifg=NONE guibg=bg gui=NONE
hi CmpItemKindText guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemKindMethod guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemKindFunction guifg=#268bd2 guibg=NONE gui=NONE
hi CmpItemKindConstructor guifg=#cb4b16 guibg=NONE gui=NONE
hi CmpItemKindField guifg=#b58900 guibg=NONE gui=NONE
hi CmpItemKindVariable guifg=#cb4b16 guibg=NONE gui=NONE
hi CmpitemKindClass guifg=#b58900 guibg=NONE gui=NONE
hi CmpItemKindInterface guifg=#b58900 guibg=NONE gui=NONE
hi CmpItemKindModule guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemKindProperty guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemKindUnit guifg=#cb4b16 guibg=NONE gui=NONE
hi CmpItemKindValue guifg=#2aa198 guibg=NONE gui=NONE
hi CmpItemKindEnum guifg=#b58900 guibg=NONE gui=NONE
hi CmpItemKindKeyword guifg=#719e07 guibg=NONE gui=NONE
hi CmpItemKindSnippet guifg=#d33682 guibg=NONE gui=NONE
hi CmpItemKindColor guifg=#d33682 guibg=NONE gui=NONE
hi CmpItemKindFile guifg=#6c71c4 guibg=NONE gui=NONE
hi CmpItemKindReference guifg=#6c71c4 guibg=NONE gui=NONE
hi CmpItemKindFolder guifg=#569CD6 guibg=NONE gui=NONE
hi CmpItemKindEnumMember guifg=#2aa198 guibg=NONE gui=NONE
hi CmpItemKindConstant guifg=#2aa198 guibg=NONE gui=NONE
hi CmpItemKindStruct guifg=#b58900 guibg=NONE gui=NONE
hi CmpItemKindEvent guifg=#cb4b16 guibg=NONE gui=NONE
hi CmpItemKindOperator guifg=#2aa198 guibg=NONE gui=NONE
hi CmpItemKindTypeParameter guifg=#cb4b16 guibg=NONE gui=NONE
hi CmpItemKindClass guibg=NONE guifg=#C586C0

" " Bezel color
" highlight! link CmpPmenu         Pmenu
" highlight! link CmpPmenuBorder   Pmenu
" " highlight! CmpPmenu         guibg=#242a30 
" " highlight! CmpPmenuBorder   guibg=#242a30
"
" " Single color
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6    " Search keyword
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
"
" " Function & other
" highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
" highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
" highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
" highlight! CmpItemKindText guibg=NONE guifg=#719e07
" highlight! CmpItemKindClass guibg=NONE guifg=#C586C0
" highlight! CmpItemKindFile guibg=NONE guifg=#dadada
" highlight! CmpItemKindFolder guibg=NONE guifg=#569CD6
" highlight! CmpItemKindStruct guibg=NONE guifg=#C586C0

" Lspsaga
hi LspSagaCodeActionTitle guifg=#719e07
hi LspSagaBorderTitle guifg=#b58900 guibg=NONE gui=bold
hi LspSagaDiagnosticHeader guifg=#b58900
hi ProviderTruncateLine guifg=#073642
hi LspSagaShTruncateLine guifg=#073642
hi LspSagaDocTruncateLine guifg=#073642
hi LspSagaCodeActionTruncateLine guifg=#073642
hi LspSagaHoverBorder guifg=#2aa198
hi LspSagaRenameBorder guifg=#2aa198 
hi LSPSagaDiagnosticBorder guifg=#2aa198 
hi LspSagaSignatureHelpBorder guifg=#2aa198 
hi LspSagaCodeActionBorder guifg=#2aa198 
hi LspSagaLspFinderBorder guifg=#2aa198 
hi LspSagaFloatWinBorder guifg=#2aa198 
hi LspSagaSignatureHelpBorder guifg=#2aa198 
hi LspSagaDefPreviewBorder guifg=#2aa198 
hi LspSagaAutoPreviewBorder guifg=#2aa198 
hi LspFloatWinBorder guifg=#2aa198 
hi LspLinesDiagBorder guifg=#2aa198 
hi LspSagaFinderSelection guifg=#719e07 guibg=NONE gui=bold

hi LspSagaWinbarObject guifg=#6c6c6c
hi LspSagaWinbarKey guifg=#6c6c6c
hi LspSagaWinbarSep guifg=#6c6c6c
hi LspSagaWinbarEnum guifg=#6c6c6c
hi LspSagaWinbarFile guifg=#6c6c6c
hi LspSagaWinbarNull guifg=#6c6c6c
hi LspSagaWinbarArray guifg=#6c6c6c
hi LspSagaWinbarClass guifg=#6c6c6c
hi LspSagaWinbarEvent guifg=#6c6c6c
hi LspSagaWinbarField guifg=#6c6c6c
hi LspSagaWinbarMacro guifg=#6c6c6c
hi LspSagaWinbarMethod guifg=#6c6c6c
hi LspSagaWinbarModule guifg=#6c6c6c
hi LspSagaWinbarNumber guifg=#6c6c6c
hi LspSagaWinbarString guifg=#6c6c6c
hi LspSagaWinbarStruct guifg=#6c6c6c
hi LspSagaWinbarBoolean guifg=#6c6c6c
hi LspSagaWinbarPackage guifg=#6c6c6c
hi LspSagaWinbarConstant guifg=#6c6c6c
hi LspSagaWinbarFunction guifg=#6c6c6c
hi LspSagaWinbarOperator guifg=#6c6c6c
hi LspSagaWinbarProperty guifg=#6c6c6c
hi LspSagaWinbarVariable guifg=#6c6c6c
hi LspSagaWinbarInterface guifg=#6c6c6c
hi LspSagaWinbarNamespace guifg=#6c6c6c
hi LspSagaWinbarParameter guifg=#6c6c6c
hi LspSagaWinbarTypeAlias guifg=#6c6c6c
hi LspSagaWinbarEnumMember guifg=#6c6c6c
hi LspSagaWinbarConstructor guifg=#6c6c6c
hi LspSagaWinbarStaticMethod guifg=#6c6c6c
hi LspSagaWinbarTypeParameter guifg=#6c6c6c

" Lightbulb
hi LspSagaLightBulb guifg=#FFD700

" Lsp Icon Error/Warning/Info/Hint
hi DiagnosticHint guifg=#2aa198

" Lspconfig Error/Warning/Info/Hint
hi DiagnosticVirtualTextError guifg=#dc322f guibg=#330D05 gui=NONE
hi DiagnosticVirtualTextInfo guifg=#268bd2 guibg=#003366 gui=NONE
hi DiagnosticVirtualTextWarn guifg=#b58900 guibg=#221704 gui=NONE
hi DiagnosticVirtualTextHint guifg=#2aa198 guibg=#0A3530 gui=NONE
hi DiagnosticUnderlineError guifg=none guibg=none gui=undercurl
hi DiagnosticUnderlineWarn guifg=none guibg=none gui=undercurl
hi DiagnosticUnderlineInfo guifg=none guibg=none gui=undercurl
hi DiagnosticUnderlineHint guifg=none guibg=none gui=undercurl

" ------------------------------------------

" Tree-Sitter
hi @variable guifg=NONE

hi @function guifg=#268bd2
hi @function.call guifg=#268bd2
hi @operator guifg=#719e07
hi @keyword.operator guifg=#719e07
"
hi @property guifg=#268bd2
hi @field guifg=#268bd2
hi @method guifg=#cb4b16
hi @method.call guifg=#ff6666
hi @parameter guifg=#268bd2
"
hi @keyword guifg=#719e07
hi @keyword.function guifg=#719e07
hi @exception guifg=#719e07
"
hi @statement guifg=#cb4b16
hi @include guifg=#d78700
hi @type guifg=#d78700
hi @type.builtin guifg=#afd787

" 标点/括号颜色
hi @punctuation.bracket guifg=#dc322f
hi @constructor guifg=#dc322f

hi @namespace guifg=#268bd2

hi @string guifg=#00afaf
hi @number guifg=#00afaf
hi @boolean guifg=#00afaf

hi @tag guifg=#d78700

" Gitsigns
hi GitSignsAddLn guifg=#719e07 guibg=NONE
hi GitSignsAddNr guifg=#719e07 guibg=NONE
hi GitSignsChangeLn guifg=#b58900 guibg=NONE
hi GitSignsChangeNr guifg=#b58900 guibg=NONE
hi GitSignsDeleteLn guifg=#dc322f guibg=NONE
hi GitSignsDeleteNr guifg=#dc322f guibg=NONE

" Leap
hi LeapMatch guifg=#FFD700
" hi LeapLabelPrimary guifg=#000000 guibg=#719e07

" Telescope
hi TelescopeMatching guifg=#cb4b16 
hi TelescopeBorder guifg=NONE " float border not quite dark enough maybe that needs to change?
hi TelescopePromptBorder guifg=#2aa198 "active border lighter for clarity
hi TelescopeTitle guifg=NONE " separate them from the border a little, but not make them pop
hi TelescopePromptPrefix guifg=NONE  " default is groups=Identifier
hi TelescopeSelection guibg=#073642
hi TelescopeSelectionCaret guifg=#2aa198

" ------------------------------------------

" Background
hi Normal guibg=NONE guifg=#839496 gui=NONE
" hi Normal guibg=NONE guifg=NONE gui=NONE

" hi NormalNC guibg=NONE guifg=#000000 gui=NONE

" Comment
" hi Comment guibg=NONE guifg=#5faf5f gui=italic
hi Comment guibg=NONE guifg=#586e75 gui=italic

" Cursor Line
hi Cursor guifg=#002b36  guibg=#839496 gui=NONE
hi CursorLineNr guifg=#b58900 guibg=#000000 gui=BOLD
" hi CursorLine guifg=NONE guibg=NONE gui=BOLD
hi CursorLine guifg=NONE guibg=#002b36 gui=BOLD

" String
hi String guibg=NONE guifg=#ff8000  guibg=NONE

" Text
hi NonText guifg=#949494 guibg=NONE gui=BOLD

" Visual
hi Visual guibg=NONE guifg=NONE gui=reverse
hi VisualNOS guifg=NONE guibg=#073642 gui=reverse

hi VimCommand guifg=#b58900
hi VimIsCommand guifg=#657b83
hi VimSynMtchOpt guifg=#b58900
hi vimSynType guifg=#2aa198
hi vimHiLink guifg=#268bd2
hi vimGroup guifg=#268bd2

hi SpecialKey guifg=#949494 guibg=#303030 gui=BOLD
hi SpellBad guifg=NONE guibg=NONE gui=underline
hi SpellCap guifg=NONE guibg=NONE gui=underline
hi SpellLocal guifg=NONE guibg=NONE gui=underline
hi SpellRare guifg=NONE guibg=NONE gui=underline
hi Title guifg=#cb4b16 guibg=NONE gui=BOLD
hi FoldColumn guifg=#839496 guibg=#073642 gui=NONE
hi Folded guifg=#839496 guibg=#073642 gui=BOLD

hi LineNr guifg=#586e75 guibg=NONE gui=NONE

hi Terminal guifg=fg guibg=NONE gui=NONE
hi DiffAdd guifg=#87af00 guibg=#073642 gui=BOLD
hi DiffChange guifg=#b58900 guibg=#073642 gui=BOLD
hi DiffDelete guifg=#d70000 guibg=#073642 gui=BOLD
hi DiffText guifg=#268bd2 guibg=#073642 gui=BOLD
hi StatusLine guifg=#073642 guibg=#93a1a1 gui=reverse
hi StatusLineNC guifg=#073642 guibg=#657b83 gui=reverse

hi TabLine guifg=#839496 guibg=#073642 gui=NONE
hi TabLineFill guifg=#839496 guibg=#073642 gui=NONE
hi TabLineSel guifg=#b58900 guibg=bg gui=BOLD

hi VertSplit guifg=#6c6c6c guibg=NONE gui=NONE

hi ColorColumn guifg=NONE guibg=#b58900 gui=NONE
hi Conceal guifg=#268bd2 guibg=NONE gui=NONE
hi CursorColumn guifg=NONE guibg=#073642 gui=NONE
hi Directory guifg=#268bd2 guibg=NONE gui=NONE
hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE
hi Error guifg=#dc322f guibg=NONE gui=BOLD,reverse
hi ErrorMsg guifg=#dc322f guibg=NONE gui=reverse

hi Search guifg=#b58900 guibg=NONE gui=reverse
hi IncSearch guifg=#cb4b16 guibg=NONE gui=reverse
hi CurSearch guifg=#b58900 guibg=#c0c0c0 gui=reverse

hi MatchParen guifg=#dc322f guibg=#586e75 gui=BOLD
hi ModeMsg guifg=#008787 guibg=NONE gui=NONE
hi MoreMsg guifg=#008787 guibg=NONE gui=NONE
hi Pmenu guifg=NONE guibg=#073642 gui=NONE
hi PmenuSbar guifg=NONE guibg=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#4e4e4e gui=NONE
hi PmenuThumb guifg=NONE guibg=#767676 gui=NONE
hi Question guifg=#00afaf guibg=NONE gui=BOLD
hi SignColumn guifg=#9e9e9e guibg=NONE gui=NONE


hi WarningMsg guifg=#dc322f guibg=NONE gui=BOLD
hi Warning guifg=#b58900 guibg=NONE gui=BOLD
hi WildMenu guifg=#ffffd7 guibg=#303030 gui=reverse

hi Constant guifg=#00afaf guibg=NONE gui=NONE
hi Identifier guifg=#268bd2 guibg=NONE gui=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE
hi PreProc guifg=#d75f00 guibg=NONE gui=NONE

hi Special guifg=#dc322f guibg=NONE gui=NONE

hi Statement guifg=#719e07 guibg=NONE gui=NONE
hi Todo guifg=#d33682 guibg=NONE gui=BOLD
hi Type guifg=#af8700 guibg=NONE gui=NONE
hi Underlined guifg=#5f5faf guibg=NONE gui=NONE
hi CursorIM guifg=NONE guibg=fg gui=NONE
hi ToolbarLine guifg=NONE guibg=#303030 gui=NONE
hi ToolbarButton guifg=#e4e4e4 guibg=#303030 gui=BOLD
hi NormalMode guifg=#9e9e9e guibg=#ffffd7 gui=reverse
hi InsertMode guifg=#00afaf guibg=#ffffd7 gui=reverse
hi ReplaceMode guifg=#d75f00 guibg=#ffffd7 gui=reverse
" hi VisualMode guifg=#d70087 guibg=#ffffd7 gui=reverse
hi CommandMode guifg=#d70087 guibg=#ffffd7 gui=reverse
hi TermCursorNC guifg=#262626 guibg=#767676 gui=NONE
hi GitGutterAdd    guifg=#719e07
hi GitGutterChange guifg=#b58900
hi GitGutterDelete guifg=#dc322f
hi GitGutterChangeDelete guifg=#dc322f
