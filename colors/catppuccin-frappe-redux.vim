" -----------------------------------------------------------------------------
" Name:           Gruvbox Material
" Description:    Gruvbox with Material Palette
" Author:         jjlabs <jj@jjlabs.dev>
" Website:        https://gitlab.com/jjlabs/catppuccin-frappe-redux
" License:        MIT
" -----------------------------------------------------------------------------

" Initialization: {{{
let s:configuration = catppuccin_frappe_redux#get_configuration()
let s:palette = catppuccin_frappe_redux#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
let s:path = expand('<sfile>:p') " the path of this script
let s:last_modified = 'Mon Sep  2 06:14:54 UTC 2024'
let g:catppuccin_frappe_redux_loaded_file_types = []

if !(exists('g:colors_name') && g:colors_name ==# 'catppuccin-frappe-redux' && s:configuration.better_performance)
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'catppuccin-frappe-redux'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background >= 1
  call catppuccin_frappe_redux#highlight('Normal', s:palette.fg0, s:palette.none)
  call catppuccin_frappe_redux#highlight('NormalNC', s:palette.fg0, s:palette.none)
  call catppuccin_frappe_redux#highlight('Terminal', s:palette.fg0, s:palette.none)
  if s:configuration.show_eob
    call catppuccin_frappe_redux#highlight('EndOfBuffer', s:palette.bg5, s:palette.none)
  else
    call catppuccin_frappe_redux#highlight('EndOfBuffer', s:palette.bg0, s:palette.none)
  endif
  if s:configuration.ui_contrast ==# 'low'
    call catppuccin_frappe_redux#highlight('FoldColumn', s:palette.bg5, s:palette.none)
  else
    call catppuccin_frappe_redux#highlight('FoldColumn', s:palette.grey0, s:palette.none)
  endif
  call catppuccin_frappe_redux#highlight('Folded', s:palette.grey1, s:palette.none)
  call catppuccin_frappe_redux#highlight('SignColumn', s:palette.fg0, s:palette.none)
  call catppuccin_frappe_redux#highlight('ToolbarLine', s:palette.fg0, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('Normal', s:palette.fg0, s:palette.bg0)
  if s:configuration.dim_inactive_windows
    call catppuccin_frappe_redux#highlight('NormalNC', s:palette.fg0, s:palette.bg_dim)
  else
    call catppuccin_frappe_redux#highlight('NormalNC', s:palette.fg0, s:palette.bg0)
  endif
  call catppuccin_frappe_redux#highlight('Terminal', s:palette.fg0, s:palette.bg0)
  if s:configuration.show_eob
    call catppuccin_frappe_redux#highlight('EndOfBuffer', s:palette.bg5, s:palette.none)
  else
    call catppuccin_frappe_redux#highlight('EndOfBuffer', s:palette.bg0, s:palette.none)
  endif
  call catppuccin_frappe_redux#highlight('Folded', s:palette.grey1, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('ToolbarLine', s:palette.fg1, s:palette.bg3)
  if s:configuration.sign_column_background ==# 'grey'
    call catppuccin_frappe_redux#highlight('SignColumn', s:palette.fg0, s:palette.bg2)
    call catppuccin_frappe_redux#highlight('FoldColumn', s:palette.grey1, s:palette.bg2)
  else
    call catppuccin_frappe_redux#highlight('SignColumn', s:palette.fg0, s:palette.none)
    if s:configuration.ui_contrast ==# 'low'
      call catppuccin_frappe_redux#highlight('FoldColumn', s:palette.bg5, s:palette.none)
    else
      call catppuccin_frappe_redux#highlight('FoldColumn', s:palette.grey0, s:palette.none)
    endif
  endif
endif
call catppuccin_frappe_redux#highlight('IncSearch', s:palette.bg0, s:palette.bg_red)
call catppuccin_frappe_redux#highlight('Search', s:palette.bg0, s:palette.bg_green)
highlight! link CurSearch IncSearch
call catppuccin_frappe_redux#highlight('ColorColumn', s:palette.none, s:palette.bg2)
if s:configuration.ui_contrast ==# 'low'
  call catppuccin_frappe_redux#highlight('Conceal', s:palette.bg5, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('Conceal', s:palette.grey0, s:palette.none)
endif
if s:configuration.cursor ==# 'auto'
  call catppuccin_frappe_redux#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
else
  call catppuccin_frappe_redux#highlight('Cursor', s:palette.bg0, s:palette[s:configuration.cursor])
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
if &diff
  call catppuccin_frappe_redux#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call catppuccin_frappe_redux#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call catppuccin_frappe_redux#highlight('CursorLine', s:palette.none, s:palette.bg1)
  call catppuccin_frappe_redux#highlight('CursorColumn', s:palette.none, s:palette.bg1)
endif
call catppuccin_frappe_redux#highlight('LineNr', s:palette.bg5, s:palette.none)
if &diff
  call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.none, 'underline')
elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background ==# 'none'
  call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.bg1)
endif
call catppuccin_frappe_redux#highlight('DiffAdd', s:palette.none, s:palette.bg_diff_green)
call catppuccin_frappe_redux#highlight('DiffChange', s:palette.none, s:palette.bg_diff_blue)
call catppuccin_frappe_redux#highlight('DiffDelete', s:palette.none, s:palette.bg_diff_red)
call catppuccin_frappe_redux#highlight('DiffText', s:palette.bg0, s:palette.blue)
call catppuccin_frappe_redux#highlight('Directory', s:palette.green, s:palette.none)
call catppuccin_frappe_redux#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
if s:configuration.ui_contrast ==# 'low'
  call catppuccin_frappe_redux#highlight('LineNr', s:palette.bg5, s:palette.none)
  if &diff
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.none, 'underline')
  elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background ==# 'none'
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.none)
  else
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey1, s:palette.bg1)
  endif
else
  call catppuccin_frappe_redux#highlight('LineNr', s:palette.grey0, s:palette.none)
  if &diff
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey2, s:palette.none, 'underline')
  elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background ==# 'none'
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey2, s:palette.none)
  else
    call catppuccin_frappe_redux#highlight('CursorLineNr', s:palette.grey2, s:palette.bg1)
  endif
endif
call catppuccin_frappe_redux#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ModeMsg', s:palette.fg0, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MoreMsg', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MatchParen', s:palette.none, s:palette.bg4)
call catppuccin_frappe_redux#highlight('NonText', s:palette.bg5, s:palette.none)
if has('nvim')
  call catppuccin_frappe_redux#highlight('Whitespace', s:palette.bg5, s:palette.none)
  call catppuccin_frappe_redux#highlight('SpecialKey', s:palette.orange, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('SpecialKey', s:palette.bg5, s:palette.none)
endif
call catppuccin_frappe_redux#highlight('Pmenu', s:palette.fg1, s:palette.bg3)
call catppuccin_frappe_redux#highlight('PmenuSbar', s:palette.none, s:palette.bg3)
if s:configuration.menu_selection_background ==# 'grey'
  call catppuccin_frappe_redux#highlight('PmenuSel', s:palette.bg3, s:palette.grey2)
elseif s:configuration.menu_selection_background ==# 'green'
  call catppuccin_frappe_redux#highlight('PmenuSel', s:palette.bg3, s:palette.bg_green)
elseif s:configuration.menu_selection_background ==# 'red'
  call catppuccin_frappe_redux#highlight('PmenuSel', s:palette.bg3, s:palette.bg_red)
else
  call catppuccin_frappe_redux#highlight('PmenuSel', s:palette.bg3, s:palette[s:configuration.menu_selection_background])
endif
call catppuccin_frappe_redux#highlight('PmenuKind', s:palette.green, s:palette.bg3)
call catppuccin_frappe_redux#highlight('PmenuExtra', s:palette.grey2, s:palette.bg3)
highlight! link WildMenu PmenuSel
call catppuccin_frappe_redux#highlight('PmenuThumb', s:palette.none, s:palette.grey0)
if s:configuration.float_style ==# 'dim'
  call catppuccin_frappe_redux#highlight('NormalFloat', s:palette.fg1, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('FloatBorder', s:palette.grey1, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('FloatTitle', s:palette.orange, s:palette.bg_dim, 'bold')
else
  call catppuccin_frappe_redux#highlight('NormalFloat', s:palette.fg1, s:palette.bg3)
  call catppuccin_frappe_redux#highlight('FloatBorder', s:palette.grey1, s:palette.bg3)
  call catppuccin_frappe_redux#highlight('FloatTitle', s:palette.orange, s:palette.bg3, 'bold')
endif
call catppuccin_frappe_redux#highlight('Question', s:palette.yellow, s:palette.none)
if s:configuration.spell_foreground ==# 'none'
  call catppuccin_frappe_redux#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call catppuccin_frappe_redux#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call catppuccin_frappe_redux#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.aqua)
  call catppuccin_frappe_redux#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.purple)
else
  call catppuccin_frappe_redux#highlight('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
  call catppuccin_frappe_redux#highlight('SpellCap', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
  call catppuccin_frappe_redux#highlight('SpellLocal', s:palette.aqua, s:palette.none, 'undercurl', s:palette.aqua)
  call catppuccin_frappe_redux#highlight('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
endif
if s:configuration.transparent_background == 2
  if s:configuration.statusline_style ==# 'original'
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.grey2, s:palette.none, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.none)
    endif
  elseif s:configuration.statusline_style ==# 'mix'
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.grey2, s:palette.bg_statusline3)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.grey2, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.grey2, s:palette.none, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.none)
    endif
  else
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.fg1, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.fg1, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.fg1, s:palette.bg_statusline3)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.fg1, s:palette.none)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.fg1, s:palette.none, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.none)
    endif
  endif
else
  if s:configuration.statusline_style ==# 'original'
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.grey2, s:palette.bg0)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.grey2, s:palette.bg_statusline2, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.bg_statusline1)
    endif
  elseif s:configuration.statusline_style ==# 'mix'
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.grey2, s:palette.bg_statusline3)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.grey2, s:palette.bg_statusline2)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.grey2, s:palette.bg_statusline2, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.bg_statusline1)
    endif
  else
    call catppuccin_frappe_redux#highlight('StatusLine', s:palette.fg1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('StatusLineTerm', s:palette.fg1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('StatusLineNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('TabLine', s:palette.fg1, s:palette.bg_statusline3)
    call catppuccin_frappe_redux#highlight('TabLineFill', s:palette.fg1, s:palette.bg_statusline1)
    call catppuccin_frappe_redux#highlight('TabLineSel', s:palette.bg0, s:palette.grey2)
    if has('nvim')
      call catppuccin_frappe_redux#highlight('WinBar', s:palette.fg1, s:palette.bg_statusline1, 'bold')
      call catppuccin_frappe_redux#highlight('WinBarNC', s:palette.grey1, s:palette.bg_statusline1)
    endif
  endif
endif
if s:configuration.dim_inactive_windows
  call catppuccin_frappe_redux#highlight('VertSplit', s:palette.bg4, s:palette.bg_dim)
else
  call catppuccin_frappe_redux#highlight('VertSplit', s:palette.bg5, s:palette.none)
endif
highlight! link WinSeparator VertSplit
if s:configuration.visual ==# 'grey background'
  call catppuccin_frappe_redux#highlight('Visual', s:palette.none, s:palette.bg3)
  call catppuccin_frappe_redux#highlight('VisualNOS', s:palette.none, s:palette.bg3)
elseif s:configuration.visual ==# 'green background'
  call catppuccin_frappe_redux#highlight('Visual', s:palette.none, s:palette.bg_visual_green)
  call catppuccin_frappe_redux#highlight('VisualNOS', s:palette.none, s:palette.bg_visual_green)
elseif s:configuration.visual ==# 'blue background'
  call catppuccin_frappe_redux#highlight('Visual', s:palette.none, s:palette.bg_visual_blue)
  call catppuccin_frappe_redux#highlight('VisualNOS', s:palette.none, s:palette.bg_visual_blue)
elseif s:configuration.visual ==# 'red background'
  call catppuccin_frappe_redux#highlight('Visual', s:palette.none, s:palette.bg_visual_red)
  call catppuccin_frappe_redux#highlight('VisualNOS', s:palette.none, s:palette.bg_visual_red)
elseif s:configuration.visual ==# 'reverse'
  call catppuccin_frappe_redux#highlight('Visual', s:palette.none, s:palette.none, 'reverse')
  call catppuccin_frappe_redux#highlight('VisualNOS', s:palette.none, s:palette.none, 'reverse')
endif
call catppuccin_frappe_redux#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Debug', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('debugPC', s:palette.bg0, s:palette.green)
call catppuccin_frappe_redux#highlight('debugBreakpoint', s:palette.bg0, s:palette.red)
call catppuccin_frappe_redux#highlight('ToolbarButton', s:palette.bg0, s:palette.grey2)
if has('nvim')
  call catppuccin_frappe_redux#highlight('Substitute', s:palette.bg0, s:palette.yellow)
  if s:configuration.diagnostic_text_highlight
    call catppuccin_frappe_redux#highlight('DiagnosticError', s:palette.red, s:palette.bg_visual_red)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineError', s:palette.none, s:palette.bg_visual_red, 'undercurl', s:palette.red)
    call catppuccin_frappe_redux#highlight('DiagnosticWarn', s:palette.yellow, s:palette.bg_visual_yellow)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineWarn', s:palette.none, s:palette.bg_visual_yellow, 'undercurl', s:palette.yellow)
    call catppuccin_frappe_redux#highlight('DiagnosticInfo', s:palette.blue, s:palette.bg_visual_blue)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineInfo', s:palette.none, s:palette.bg_visual_blue, 'undercurl', s:palette.blue)
    call catppuccin_frappe_redux#highlight('DiagnosticHint', s:palette.green, s:palette.bg_visual_green)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineHint', s:palette.none, s:palette.bg_visual_green, 'undercurl', s:palette.green)
  else
    call catppuccin_frappe_redux#highlight('DiagnosticError', s:palette.red, s:palette.none)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
    call catppuccin_frappe_redux#highlight('DiagnosticWarn', s:palette.yellow, s:palette.none)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineWarn', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
    call catppuccin_frappe_redux#highlight('DiagnosticInfo', s:palette.blue, s:palette.none)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
    call catppuccin_frappe_redux#highlight('DiagnosticHint', s:palette.green, s:palette.none)
    call catppuccin_frappe_redux#highlight('DiagnosticUnderlineHint', s:palette.none, s:palette.none, 'undercurl', s:palette.green)
  endif
  highlight! link DiagnosticFloatingError ErrorFloat
  highlight! link DiagnosticFloatingWarn WarningFloat
  highlight! link DiagnosticFloatingInfo InfoFloat
  highlight! link DiagnosticFloatingHint HintFloat
  highlight! link DiagnosticVirtualTextError VirtualTextError
  highlight! link DiagnosticVirtualTextWarn VirtualTextWarning
  highlight! link DiagnosticVirtualTextInfo VirtualTextInfo
  highlight! link DiagnosticVirtualTextHint VirtualTextHint
  highlight! link DiagnosticSignError RedSign
  highlight! link DiagnosticSignWarn YellowSign
  highlight! link DiagnosticSignInfo BlueSign
  highlight! link DiagnosticSignHint GreenSign
  highlight! link LspDiagnosticsFloatingError DiagnosticFloatingError
  highlight! link LspDiagnosticsFloatingWarning DiagnosticFloatingWarn
  highlight! link LspDiagnosticsFloatingInformation DiagnosticFloatingInfo
  highlight! link LspDiagnosticsFloatingHint DiagnosticFloatingHint
  highlight! link LspDiagnosticsDefaultError DiagnosticError
  highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
  highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
  highlight! link LspDiagnosticsDefaultHint DiagnosticHint
  highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
  highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
  highlight! link LspDiagnosticsVirtualTextInformation DiagnosticVirtualTextInfo
  highlight! link LspDiagnosticsVirtualTextHint DiagnosticVirtualTextHint
  highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
  highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  highlight! link LspDiagnosticsSignError DiagnosticSignError
  highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
  highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
  highlight! link LspDiagnosticsSignHint DiagnosticSignHint
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
  highlight! link LspInlayHint InlayHints
  highlight! link LspCodeLens VirtualTextInfo
  highlight! link LspCodeLensSeparator VirtualTextHint
  highlight! link LspSignatureActiveParameter Search
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
endif
" }}}
" Syntax: {{{
call catppuccin_frappe_redux#highlight('Boolean', s:palette.purple, s:palette.none)
call catppuccin_frappe_redux#highlight('Number', s:palette.purple, s:palette.none)
call catppuccin_frappe_redux#highlight('Float', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call catppuccin_frappe_redux#highlight('PreProc', s:palette.purple, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('PreCondit', s:palette.purple, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Include', s:palette.purple, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Define', s:palette.purple, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Conditional', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Repeat', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Keyword', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Typedef', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Exception', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('Statement', s:palette.red, s:palette.none, 'italic')
else
  call catppuccin_frappe_redux#highlight('PreProc', s:palette.purple, s:palette.none)
  call catppuccin_frappe_redux#highlight('PreCondit', s:palette.purple, s:palette.none)
  call catppuccin_frappe_redux#highlight('Include', s:palette.purple, s:palette.none)
  call catppuccin_frappe_redux#highlight('Define', s:palette.purple, s:palette.none)
  call catppuccin_frappe_redux#highlight('Conditional', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('Repeat', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('Keyword', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('Typedef', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('Exception', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('Statement', s:palette.red, s:palette.none)
endif
call catppuccin_frappe_redux#highlight('Error', s:palette.red, s:palette.none)
call catppuccin_frappe_redux#highlight('StorageClass', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Tag', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Label', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Structure', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Operator', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Title', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Special', s:palette.yellow, s:palette.none)
call catppuccin_frappe_redux#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call catppuccin_frappe_redux#highlight('Type', s:palette.yellow, s:palette.none)
if s:configuration.enable_bold
  call catppuccin_frappe_redux#highlight('Function', s:palette.green, s:palette.none, 'bold')
else
  call catppuccin_frappe_redux#highlight('Function', s:palette.green, s:palette.none)
endif
call catppuccin_frappe_redux#highlight('String', s:palette.green, s:palette.none)
call catppuccin_frappe_redux#highlight('Character', s:palette.green, s:palette.none)
call catppuccin_frappe_redux#highlight('Constant', s:palette.aqua, s:palette.none)
call catppuccin_frappe_redux#highlight('Macro', s:palette.aqua, s:palette.none)
call catppuccin_frappe_redux#highlight('Identifier', s:palette.blue, s:palette.none)
if has('nvim')
  call catppuccin_frappe_redux#highlight('Todo', s:palette.bg0, s:palette.blue, 'bold')
else
  call catppuccin_frappe_redux#highlight('Todo', s:palette.blue, s:palette.bg0, 'reverse,bold')
endif
if s:configuration.disable_italic_comment
  call catppuccin_frappe_redux#highlight('Comment', s:palette.grey1, s:palette.none)
  call catppuccin_frappe_redux#highlight('SpecialComment', s:palette.grey1, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('Comment', s:palette.grey1, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('SpecialComment', s:palette.grey1, s:palette.none, 'italic')
endif
call catppuccin_frappe_redux#highlight('Delimiter', s:palette.fg0, s:palette.none)
call catppuccin_frappe_redux#highlight('Ignore', s:palette.grey1, s:palette.none)
call catppuccin_frappe_redux#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call catppuccin_frappe_redux#highlight('Fg', s:palette.fg0, s:palette.none)
call catppuccin_frappe_redux#highlight('Grey', s:palette.grey1, s:palette.none)
call catppuccin_frappe_redux#highlight('Red', s:palette.red, s:palette.none)
call catppuccin_frappe_redux#highlight('Orange', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('Yellow', s:palette.yellow, s:palette.none)
call catppuccin_frappe_redux#highlight('Green', s:palette.green, s:palette.none)
call catppuccin_frappe_redux#highlight('Aqua', s:palette.aqua, s:palette.none)
call catppuccin_frappe_redux#highlight('Blue', s:palette.blue, s:palette.none)
call catppuccin_frappe_redux#highlight('Purple', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call catppuccin_frappe_redux#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('AquaItalic', s:palette.aqua, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
  call catppuccin_frappe_redux#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call catppuccin_frappe_redux#highlight('RedItalic', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('OrangeItalic', s:palette.orange, s:palette.none)
  call catppuccin_frappe_redux#highlight('YellowItalic', s:palette.yellow, s:palette.none)
  call catppuccin_frappe_redux#highlight('GreenItalic', s:palette.green, s:palette.none)
  call catppuccin_frappe_redux#highlight('AquaItalic', s:palette.aqua, s:palette.none)
  call catppuccin_frappe_redux#highlight('BlueItalic', s:palette.blue, s:palette.none)
  call catppuccin_frappe_redux#highlight('PurpleItalic', s:palette.purple, s:palette.none)
endif
if s:configuration.enable_bold
  call catppuccin_frappe_redux#highlight('RedBold', s:palette.red, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('OrangeBold', s:palette.orange, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('YellowBold', s:palette.yellow, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('GreenBold', s:palette.green, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('AquaBold', s:palette.aqua, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('BlueBold', s:palette.blue, s:palette.none, 'bold')
  call catppuccin_frappe_redux#highlight('PurpleBold', s:palette.purple, s:palette.none, 'bold')
else
  call catppuccin_frappe_redux#highlight('RedBold', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('OrangeBold', s:palette.orange, s:palette.none)
  call catppuccin_frappe_redux#highlight('YellowBold', s:palette.yellow, s:palette.none)
  call catppuccin_frappe_redux#highlight('GreenBold', s:palette.green, s:palette.none)
  call catppuccin_frappe_redux#highlight('AquaBold', s:palette.aqua, s:palette.none)
  call catppuccin_frappe_redux#highlight('BlueBold', s:palette.blue, s:palette.none)
  call catppuccin_frappe_redux#highlight('PurpleBold', s:palette.purple, s:palette.none)
endif
if s:configuration.transparent_background || s:configuration.sign_column_background ==# 'none'
  call catppuccin_frappe_redux#highlight('RedSign', s:palette.red, s:palette.none)
  call catppuccin_frappe_redux#highlight('OrangeSign', s:palette.orange, s:palette.none)
  call catppuccin_frappe_redux#highlight('YellowSign', s:palette.yellow, s:palette.none)
  call catppuccin_frappe_redux#highlight('GreenSign', s:palette.green, s:palette.none)
  call catppuccin_frappe_redux#highlight('AquaSign', s:palette.aqua, s:palette.none)
  call catppuccin_frappe_redux#highlight('BlueSign', s:palette.blue, s:palette.none)
  call catppuccin_frappe_redux#highlight('PurpleSign', s:palette.purple, s:palette.none)
else
  call catppuccin_frappe_redux#highlight('RedSign', s:palette.red, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('OrangeSign', s:palette.orange, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('YellowSign', s:palette.yellow, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('GreenSign', s:palette.green, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('AquaSign', s:palette.aqua, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('BlueSign', s:palette.blue, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('PurpleSign', s:palette.purple, s:palette.bg2)
endif
if s:configuration.diagnostic_text_highlight
  call catppuccin_frappe_redux#highlight('ErrorText', s:palette.none, s:palette.bg_visual_red, 'undercurl', s:palette.red)
  call catppuccin_frappe_redux#highlight('WarningText', s:palette.none, s:palette.bg_visual_yellow, 'undercurl', s:palette.yellow)
  call catppuccin_frappe_redux#highlight('InfoText', s:palette.none, s:palette.bg_visual_blue, 'undercurl', s:palette.blue)
  call catppuccin_frappe_redux#highlight('HintText', s:palette.none, s:palette.bg_visual_green, 'undercurl', s:palette.green)
else
  call catppuccin_frappe_redux#highlight('ErrorText', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call catppuccin_frappe_redux#highlight('WarningText', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
  call catppuccin_frappe_redux#highlight('InfoText', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call catppuccin_frappe_redux#highlight('HintText', s:palette.none, s:palette.none, 'undercurl', s:palette.green)
endif
if s:configuration.diagnostic_line_highlight
  call catppuccin_frappe_redux#highlight('ErrorLine', s:palette.none, s:palette.bg_visual_red)
  call catppuccin_frappe_redux#highlight('WarningLine', s:palette.none, s:palette.bg_visual_yellow)
  call catppuccin_frappe_redux#highlight('InfoLine', s:palette.none, s:palette.bg_visual_blue)
  call catppuccin_frappe_redux#highlight('HintLine', s:palette.none, s:palette.bg_visual_green)
else
  highlight clear ErrorLine
  highlight clear WarningLine
  highlight clear InfoLine
  highlight clear HintLine
endif
if s:configuration.diagnostic_virtual_text ==# 'grey'
  highlight! link VirtualTextWarning Grey
  highlight! link VirtualTextError Grey
  highlight! link VirtualTextInfo Grey
  highlight! link VirtualTextHint Grey
elseif s:configuration.diagnostic_virtual_text ==# 'colored'
  highlight! link VirtualTextWarning Yellow
  highlight! link VirtualTextError Red
  highlight! link VirtualTextInfo Blue
  highlight! link VirtualTextHint Green
else
  call catppuccin_frappe_redux#highlight('VirtualTextWarning', s:palette.yellow, s:palette.bg_visual_yellow)
  call catppuccin_frappe_redux#highlight('VirtualTextError', s:palette.red, s:palette.bg_visual_red)
  call catppuccin_frappe_redux#highlight('VirtualTextInfo', s:palette.blue, s:palette.bg_visual_blue)
  call catppuccin_frappe_redux#highlight('VirtualTextHint', s:palette.green, s:palette.bg_visual_green)
endif
call catppuccin_frappe_redux#highlight('ErrorFloat', s:palette.red, s:palette.none)
call catppuccin_frappe_redux#highlight('WarningFloat', s:palette.yellow, s:palette.none)
call catppuccin_frappe_redux#highlight('InfoFloat', s:palette.blue, s:palette.none)
call catppuccin_frappe_redux#highlight('HintFloat', s:palette.green, s:palette.none)
if &diff
  call catppuccin_frappe_redux#highlight('CurrentWord', s:palette.bg0, s:palette.bg_green)
elseif s:configuration.current_word ==# 'grey background'
  call catppuccin_frappe_redux#highlight('CurrentWord', s:palette.none, s:palette.bg_current_word)
elseif s:configuration.current_word ==# 'high contrast background'
  call catppuccin_frappe_redux#highlight('CurrentWord', s:palette.none, s:palette.bg4)
else
  call catppuccin_frappe_redux#highlight('CurrentWord', s:palette.none, s:palette.none, s:configuration.current_word)
endif
if s:configuration.inlay_hints_background ==# 'none'
  highlight! link InlayHints LineNr
else
  if &background ==# 'dark'
    call catppuccin_frappe_redux#highlight('InlayHints', s:palette.grey0, s:palette.bg_dim)
  else
    call catppuccin_frappe_redux#highlight('InlayHints', s:palette.grey1, s:palette.bg_dim)
  endif
endif
" Define a color for each LSP item kind to create highlights for nvim-cmp, aerial.nvim, nvim-navic and coc.nvim
let g:catppuccin_frappe_redux_lsp_kind_color = [
      \ ["Array", "Aqua"],
      \ ["Boolean", "Aqua"],
      \ ["Class", "Red"],
      \ ["Color", "Aqua"],
      \ ["Constant", "Blue"],
      \ ["Constructor", "Green"],
      \ ["Default", "Aqua"],
      \ ["Enum", "Yellow"],
      \ ["EnumMember", "Purple"],
      \ ["Event", "Orange"],
      \ ["Field", "Green"],
      \ ["File", "Green"],
      \ ["Folder", "Aqua"],
      \ ["Function", "Green"],
      \ ["Interface", "Yellow"],
      \ ["Key", "Red"],
      \ ["Keyword", "Red"],
      \ ["Method", "Green"],
      \ ["Module", "Purple"],
      \ ["Namespace", "Purple"],
      \ ["Null", "Aqua"],
      \ ["Number", "Aqua"],
      \ ["Object", "Aqua"],
      \ ["Operator", "Orange"],
      \ ["Package", "Purple"],
      \ ["Property", "Blue"],
      \ ["Reference", "Aqua"],
      \ ["Snippet", "Aqua"],
      \ ["String", "Aqua"],
      \ ["Struct", "Yellow"],
      \ ["Text", "Fg"],
      \ ["TypeParameter", "Yellow"],
      \ ["Unit", "Purple"],
      \ ["Value", "Purple"],
      \ ["Variable", "Blue"],
      \ ]
" }}}
" }}}
" Terminal: {{{
if ((has('termguicolors') && &termguicolors) || has('gui_running')) && !s:configuration.disable_terminal_colors
  " Definition
  let s:terminal = {
        \ 'black':         &background ==# 'dark' ? s:palette.bg5 : s:palette.fg0,
        \ 'red':           s:palette.red,
        \ 'yellow':        s:palette.yellow,
        \ 'green':         s:palette.green,
        \ 'cyan':          s:palette.aqua,
        \ 'blue':          s:palette.blue,
        \ 'purple':        s:palette.purple,
        \ 'white':         &background ==# 'dark' ? s:palette.fg0 : s:palette.bg5,
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
call catppuccin_frappe_redux#highlight('TSStrong', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('TSEmphasis', s:palette.none, s:palette.none, 'italic')
call catppuccin_frappe_redux#highlight('TSUnderline', s:palette.none, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('TSNote', s:palette.bg0, s:palette.green, 'bold')
call catppuccin_frappe_redux#highlight('TSWarning', s:palette.bg0, s:palette.yellow, 'bold')
call catppuccin_frappe_redux#highlight('TSDanger', s:palette.bg0, s:palette.red, 'bold')
highlight! link TSAnnotation Purple
highlight! link TSAttribute Purple
highlight! link TSBoolean Purple
highlight! link TSCharacter Aqua
highlight! link TSCharacterSpecial SpecialChar
highlight! link TSComment Comment
highlight! link TSConditional Red
highlight! link TSConstBuiltin PurpleItalic
highlight! link TSConstMacro PurpleItalic
highlight! link TSConstant Fg
highlight! link TSConstructor GreenBold
highlight! link TSDebug Debug
highlight! link TSDefine Define
highlight! link TSEnvironment Macro
highlight! link TSEnvironmentName Type
highlight! link TSError Error
highlight! link TSException Red
highlight! link TSField Blue
highlight! link TSFloat Purple
highlight! link TSFuncBuiltin GreenBold
highlight! link TSFuncMacro GreenBold
highlight! link TSFunction GreenBold
highlight! link TSFunctionCall GreenBold
highlight! link TSInclude Red
highlight! link TSKeyword Red
highlight! link TSKeywordFunction Red
highlight! link TSKeywordOperator Orange
highlight! link TSKeywordReturn Red
highlight! link TSLabel Orange
highlight! link TSLiteral String
highlight! link TSMath Blue
highlight! link TSMethod GreenBold
highlight! link TSMethodCall GreenBold
highlight! link TSNamespace YellowItalic
highlight! link TSNone Fg
highlight! link TSNumber Purple
highlight! link TSOperator Orange
highlight! link TSParameter Fg
highlight! link TSParameterReference Fg
highlight! link TSPreProc PreProc
highlight! link TSProperty Blue
highlight! link TSPunctBracket Fg
highlight! link TSPunctDelimiter Grey
highlight! link TSPunctSpecial Blue
highlight! link TSRepeat Red
highlight! link TSStorageClass Orange
highlight! link TSStorageClassLifetime Orange
highlight! link TSStrike Grey
highlight! link TSString Aqua
highlight! link TSStringEscape Green
highlight! link TSStringRegex Green
highlight! link TSStringSpecial SpecialChar
highlight! link TSSymbol Fg
highlight! link TSTag Orange
highlight! link TSTagAttribute Green
highlight! link TSTagDelimiter Green
highlight! link TSText Green
highlight! link TSTextReference Constant
highlight! link TSTitle Title
highlight! link TSTodo Todo
highlight! link TSType YellowItalic
highlight! link TSTypeBuiltin YellowItalic
highlight! link TSTypeDefinition YellowItalic
highlight! link TSTypeQualifier Orange
call catppuccin_frappe_redux#highlight('TSURI', s:palette.blue, s:palette.none, 'underline')
highlight! link TSVariable Fg
highlight! link TSVariableBuiltin PurpleItalic
if has('nvim-0.8')
  highlight! link @annotation TSAnnotation
  highlight! link @attribute TSAttribute
  highlight! link @boolean TSBoolean
  highlight! link @character TSCharacter
  highlight! link @character.special TSCharacterSpecial
  highlight! link @comment TSComment
  highlight! link @comment.error TSDanger
  highlight! link @comment.note TSNote
  highlight! link @comment.todo TSTodo
  highlight! link @comment.warning TSWarning
  highlight! link @conceal Grey
  highlight! link @conditional TSConditional
  highlight! link @constant TSConstant
  highlight! link @constant.builtin TSConstBuiltin
  highlight! link @constant.macro TSConstMacro
  highlight! link @constructor TSConstructor
  highlight! link @debug TSDebug
  highlight! link @define TSDefine
  highlight! link @diff.delta diffChanged
  highlight! link @diff.minus diffRemoved
  highlight! link @diff.plus diffAdded
  highlight! link @error TSError " This has been removed from nvim-treesitter
  highlight! link @exception TSException
  highlight! link @field TSField
  highlight! link @float TSFloat
  highlight! link @function TSFunction
  highlight! link @function.builtin TSFuncBuiltin
  highlight! link @function.call TSFunctionCall
  highlight! link @function.macro TSFuncMacro
  highlight! link @function.method TSMethod
  highlight! link @function.method.call TSMethodCall
  highlight! link @include TSInclude
  highlight! link @keyword TSKeyword
  highlight! link @keyword.conditional TSConditional
  highlight! link @keyword.debug TSDebug
  highlight! link @keyword.directive TSPreProc
  highlight! link @keyword.directive.define TSDefine
  highlight! link @keyword.exception TSException
  highlight! link @keyword.function TSKeywordFunction
  highlight! link @keyword.import TSInclude
  highlight! link @keyword.operator TSKeywordOperator
  highlight! link @keyword.repeat TSRepeat
  highlight! link @keyword.return TSKeywordReturn
  highlight! link @keyword.storage TSStorageClass
  highlight! link @label TSLabel
  highlight! link @markup.emphasis TSEmphasis
  highlight! link @markup.environment TSEnvironment
  highlight! link @markup.environment.name TSEnvironmentName
  highlight! link @markup.heading TSTitle
  highlight! link @markup.link TSTextReference
  highlight! link @markup.link.label TSStringSpecial
  highlight! link @markup.link.url TSURI
  highlight! link @markup.list TSPunctSpecial
  highlight! link @markup.list.checked Green
  highlight! link @markup.list.unchecked Ignore
  highlight! link @markup.math TSMath
  highlight! link @markup.note TSNote
  highlight! link @markup.quote Grey
  highlight! link @markup.raw TSLiteral
  highlight! link @markup.strike TSStrike
  highlight! link @markup.strong TSStrong
  highlight! link @markup.underline TSUnderline
  highlight! link @math TSMath
  highlight! link @method TSMethod
  highlight! link @method.call TSMethodCall
  highlight! link @module TSNamespace
  highlight! link @namespace TSNamespace
  highlight! link @none TSNone
  highlight! link @number TSNumber
  highlight! link @number.float TSFloat
  highlight! link @operator TSOperator
  highlight! link @parameter TSParameter
  highlight! link @parameter.reference TSParameterReference
  highlight! link @preproc TSPreProc
  highlight! link @property TSProperty
  highlight! link @punctuation.bracket TSPunctBracket
  highlight! link @punctuation.delimiter TSPunctDelimiter
  highlight! link @punctuation.special TSPunctSpecial
  highlight! link @repeat TSRepeat
  highlight! link @storageclass TSStorageClass
  highlight! link @storageclass.lifetime TSStorageClassLifetime
  highlight! link @strike TSStrike
  highlight! link @string TSString
  highlight! link @string.escape TSStringEscape
  highlight! link @string.regex TSStringRegex
  highlight! link @string.regexp TSStringRegex
  highlight! link @string.special TSStringSpecial
  highlight! link @string.special.symbol TSSymbol
  highlight! link @string.special.uri TSURI
  highlight! link @symbol TSSymbol
  highlight! link @tag TSTag
  highlight! link @tag.attribute TSTagAttribute
  highlight! link @tag.delimiter TSTagDelimiter
  highlight! link @text TSText
  highlight! link @text.danger TSDanger
  highlight! link @text.diff.add diffAdded
  highlight! link @text.diff.delete diffRemoved
  highlight! link @text.emphasis TSEmphasis
  highlight! link @text.environment TSEnvironment
  highlight! link @text.environment.name TSEnvironmentName
  highlight! link @text.literal TSLiteral
  highlight! link @text.math TSMath
  highlight! link @text.note TSNote
  highlight! link @text.reference TSTextReference
  highlight! link @text.strike TSStrike
  highlight! link @text.strong TSStrong
  highlight! link @text.title TSTitle
  highlight! link @text.todo TSTodo
  highlight! link @text.todo.checked Green
  highlight! link @text.todo.unchecked Ignore
  highlight! link @text.underline TSUnderline
  highlight! link @text.uri TSURI
  highlight! link @text.warning TSWarning
  highlight! link @todo TSTodo
  highlight! link @type TSType
  highlight! link @type.builtin TSTypeBuiltin
  highlight! link @type.definition TSTypeDefinition
  highlight! link @type.qualifier TSTypeQualifier
  highlight! link @uri TSURI
  highlight! link @variable TSVariable
  highlight! link @variable.builtin TSVariableBuiltin
  highlight! link @variable.member TSField
  highlight! link @variable.parameter TSParameter
endif
if has('nvim-0.9')
  highlight! link @lsp.type.class TSType
  highlight! link @lsp.type.comment TSComment
  highlight! link @lsp.type.decorator TSFunction
  highlight! link @lsp.type.enum TSType
  highlight! link @lsp.type.enumMember TSProperty
  highlight! link @lsp.type.events TSLabel
  highlight! link @lsp.type.function TSFunction
  highlight! link @lsp.type.interface TSType
  highlight! link @lsp.type.keyword TSKeyword
  highlight! link @lsp.type.macro TSConstMacro
  highlight! link @lsp.type.method TSMethod
  highlight! link @lsp.type.modifier TSTypeQualifier
  highlight! link @lsp.type.namespace TSNamespace
  highlight! link @lsp.type.number TSNumber
  highlight! link @lsp.type.operator TSOperator
  highlight! link @lsp.type.parameter TSParameter
  highlight! link @lsp.type.property TSProperty
  highlight! link @lsp.type.regexp TSStringRegex
  highlight! link @lsp.type.string TSString
  highlight! link @lsp.type.struct TSType
  highlight! link @lsp.type.type TSType
  highlight! link @lsp.type.typeParameter TSTypeDefinition
  highlight! link @lsp.type.variable TSVariable
  call catppuccin_frappe_redux#highlight('DiagnosticUnnecessary', s:palette.grey1, s:palette.none)
endif
highlight! link TSModuleInfoGood Green
highlight! link TSModuleInfoBad Red
" }}}
" github/copilot.vim {{{
highlight! link CopilotSuggestion Grey
" }}}
" neoclide/coc.nvim {{{
call catppuccin_frappe_redux#highlight('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
call catppuccin_frappe_redux#highlight('CocSearch', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('CocPumSearch', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('CocMarkdownHeader', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('CocMarkdownLink', s:palette.green, s:palette.none, 'underline')
highlight! link CocMarkdownCode Green
highlight! link CocPumShortcut Grey
highlight! link CocPumVirtualText Grey
highlight! link CocPumMenu Pmenu
highlight! link CocMenuSel PmenuSel
highlight! link CocDisabled Grey
highlight! link CocSnippetVisual DiffAdd
highlight! link CocInlayHint InlayHints
highlight! link CocNotificationProgress Green
highlight! link CocNotificationButton PmenuSel
highlight! link CocSemClass TSType
highlight! link CocSemEnum TSType
highlight! link CocSemInterface TSType
highlight! link CocSemStruct TSType
highlight! link CocSemTypeParameter TSType
highlight! link CocSemVariable TSVariable
highlight! link CocSemEnumMember TSProperty
highlight! link CocSemEvent TSLabel
highlight! link CocSemModifier TSOperator
highlight! link CocErrorFloat ErrorFloat
highlight! link CocWarningFloat WarningFloat
highlight! link CocInfoFloat InfoFloat
highlight! link CocHintFloat HintFloat
highlight! link CocFloating NormalFloat
highlight! link CocFloatDividingLine Grey
highlight! link CocErrorHighlight ErrorText
highlight! link CocWarningHighlight WarningText
highlight! link CocInfoHighlight InfoText
highlight! link CocHintHighlight HintText
highlight! link CocHighlightText CurrentWord
highlight! link CocHoverRange CurrentWord
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign GreenSign
highlight! link CocWarningVirtualText VirtualTextWarning
highlight! link CocErrorVirtualText VirtualTextError
highlight! link CocInfoVirtualText VirtualTextInfo
highlight! link CocHintVirtualText VirtualTextHint
highlight! link CocErrorLine ErrorLine
highlight! link CocWarningLine WarningLine
highlight! link CocInfoLine InfoLine
highlight! link CocHintLine HintLine
highlight! link CocCodeLens Grey
highlight! link CocFadeOut Grey
highlight! link CocStrikeThrough Grey
highlight! link CocListMode StatusLine
highlight! link CocListPath StatusLine
highlight! link CocSelectedText Orange
highlight! link CocListsLine Fg
highlight! link CocListsDesc Grey
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
" }}}
" prabirshrestha/vim-lsp {{{
highlight! link LspErrorVirtual VirtualTextError
highlight! link LspWarningVirtual VirtualTextWarning
highlight! link LspInformationVirtual VirtualTextInfo
highlight! link LspHintVirtual VirtualTextHint
highlight! link LspErrorHighlight ErrorText
highlight! link LspWarningHighlight WarningText
highlight! link LspInformationHighlight InfoText
highlight! link LspHintHighlight HintText
highlight! link lspReference CurrentWord
highlight! link lspInlayHintsType InlayHints
highlight! link lspInlayHintsParameter InlayHints
highlight! link LspSemanticType TSType
highlight! link LspSemanticClass TSType
highlight! link LspSemanticEnum TSType
highlight! link LspSemanticInterface TSType
highlight! link LspSemanticStruct TSType
highlight! link LspSemanticTypeParameter TSType
highlight! link LspSemanticParameter TSParameter
highlight! link LspSemanticVariable TSVariable
highlight! link LspSemanticProperty TSProperty
highlight! link LspSemanticEnumMember TSProperty
highlight! link LspSemanticEvents TSLabel
highlight! link LspSemanticFunction TSFunction
highlight! link LspSemanticMethod TSMethod
highlight! link LspSemanticKeyword TSKeyword
highlight! link LspSemanticModifier TSOperator
highlight! link LspSemanticComment TSComment
highlight! link LspSemanticString TSString
highlight! link LspSemanticNumber TSNumber
highlight! link LspSemanticRegexp TSStringRegex
highlight! link LspSemanticOperator TSOperator
" }}}
" ycm-core/YouCompleteMe {{{
highlight! link YcmErrorSign RedSign
highlight! link YcmWarningSign YellowSign
highlight! link YcmErrorLine ErrorLine
highlight! link YcmWarningLine WarningLine
highlight! link YcmErrorSection ErrorText
highlight! link YcmWarningSection WarningText
highlight! link YcmInlayHint InlayHints
highlight! link YcmErrorText VirtualTextError
highlight! link YcmWarningText VirtualTextWarning
if !has('nvim') && has('textprop') && !exists('g:YCM_HIGHLIGHT_GROUP')
  let g:YCM_HIGHLIGHT_GROUP = {
        \ 'typeParameter': 'TSType',
        \ 'parameter': 'TSParameter',
        \ 'variable': 'TSVariable',
        \ 'property': 'TSProperty',
        \ 'enumMember': 'TSVariableBuiltin',
        \ 'event': 'TSLabel',
        \ 'member': 'TSVariable',
        \ 'method': 'TSMethod',
        \ 'class': 'TSType',
        \ 'namespace': 'TSNamespace',
        \ }
  for tokenType in keys( g:YCM_HIGHLIGHT_GROUP )
    try
      call prop_type_add( 'YCM_HL_' . tokenType,
            \ { 'highlight': g:YCM_HIGHLIGHT_GROUP[ tokenType ] } )
    catch
    endtry
  endfor
endif
" }}}
" dense-analysis/ale {{{
highlight! link ALEError ErrorText
highlight! link ALEWarning WarningText
highlight! link ALEInfo InfoText
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEErrorLine ErrorLine
highlight! link ALEWarningLine WarningLine
highlight! link ALEInfoLine InfoLine
highlight! link ALEVirtualTextError VirtualTextError
highlight! link ALEVirtualTextWarning VirtualTextWarning
highlight! link ALEVirtualTextInfo VirtualTextInfo
highlight! link ALEVirtualTextStyleError VirtualTextHint
highlight! link ALEVirtualTextStyleWarning VirtualTextHint
" }}}
" neomake/neomake {{{
highlight! link NeomakeError ErrorText
highlight! link NeomakeWarning WarningText
highlight! link NeomakeInfo InfoText
highlight! link NeomakeMessage HintText
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessageSign AquaSign
highlight! link NeomakeVirtualtextError VirtualTextError
highlight! link NeomakeVirtualtextWarning VirtualTextWarning
highlight! link NeomakeVirtualtextInfo VirtualTextInfo
highlight! link NeomakeVirtualtextMessag VirtualTextHint
" }}}
" vim-syntastic/syntastic {{{
highlight! link SyntasticError ErrorText
highlight! link SyntasticWarning WarningText
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
highlight! link SyntasticErrorLine ErrorLine
highlight! link SyntasticWarningLine WarningLine
" }}}
" Yggdroot/LeaderF {{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'catppuccin_frappe_redux'
endif
if !exists('g:Lf_PopupColorscheme')
  let g:Lf_PopupColorscheme = 'catppuccin_frappe_redux'
endif
call catppuccin_frappe_redux#highlight('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_match1', s:palette.aqua, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_match2', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_match3', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_match4', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_matchRefine', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_popup_normalMode', s:palette.bg0, s:palette.grey2, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_popup_inputMode', s:palette.bg0, s:palette.grey2, 'bold')
call catppuccin_frappe_redux#highlight('Lf_hl_popup_category', s:palette.bg0, s:palette.grey1)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_nameOnlyMode', s:palette.fg1, s:palette.bg_statusline3)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_fullPathMode', s:palette.fg1, s:palette.bg_statusline3)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_fuzzyMode', s:palette.bg0, s:palette.grey0)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_regexMode', s:palette.fg1, s:palette.bg_statusline3)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_lineInfo', s:palette.bg0, s:palette.green)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_total', s:palette.bg0, s:palette.yellow)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_cursor', s:palette.bg0, s:palette.green)
call catppuccin_frappe_redux#highlight('Lf_hl_popup_inputText', s:palette.green, s:palette.bg3)
call catppuccin_frappe_redux#highlight('Lf_hl_cursorline', s:palette.fg1, s:palette.none)
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
highlight! link Lf_hl_popup_window Pmenu
highlight! link Lf_hl_popup_prompt Orange
highlight! link Lf_hl_popup_cwd Pmenu
highlight! link Lf_hl_popup_blank Lf_hl_popup_window
highlight! link Lf_hl_popup_spin Purple
" }}}
" liuchengxu/vim-clap {{{
call catppuccin_frappe_redux#highlight('ClapSelected', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapCurrentSelection', s:palette.none, s:palette.bg1, 'bold')
call catppuccin_frappe_redux#highlight('ClapSpinner', s:palette.orange, s:palette.bg3, 'bold')
call catppuccin_frappe_redux#highlight('ClapBlines', s:palette.fg1, s:palette.none)
call catppuccin_frappe_redux#highlight('ClapProviderId', s:palette.fg1, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches1', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches2', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches3', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches4', s:palette.aqua, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches5', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapMatches6', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapFuzzyMatches', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('ClapNoMatchesFound', s:palette.red, s:palette.none, 'bold')
highlight! link ClapInput Pmenu
highlight! link ClapDisplay Pmenu
highlight! link ClapPreview Pmenu
highlight! link ClapFuzzyMatches1 ClapFuzzyMatches
highlight! link ClapFuzzyMatches2 ClapFuzzyMatches
highlight! link ClapFuzzyMatches3 ClapFuzzyMatches
highlight! link ClapFuzzyMatches4 ClapFuzzyMatches
highlight! link ClapFuzzyMatches5 ClapFuzzyMatches
highlight! link ClapFuzzyMatches6 ClapFuzzyMatches
highlight! link ClapFuzzyMatches7 ClapFuzzyMatches
highlight! link ClapFuzzyMatches8 ClapFuzzyMatches
highlight! link ClapFuzzyMatches9 ClapFuzzyMatches
highlight! link ClapFuzzyMatches10 ClapFuzzyMatches
highlight! link ClapFuzzyMatches11 ClapFuzzyMatches
highlight! link ClapFuzzyMatches12 ClapFuzzyMatches
highlight! link ClapBlinesLineNr Grey
highlight! link ClapProviderColon ClapBlines
highlight! link ClapProviderAbout ClapBlines
highlight! link ClapFile Fg
highlight! link ClapSearchText ClapFuzzyMatches
" }}}
" junegunn/fzf.vim {{{
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Green'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Aqua'],
      \ 'info':    ['fg', 'Aqua'],
      \ 'border':  ['fg', 'Grey'],
      \ 'prompt':  ['fg', 'Orange'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['fg', 'Grey']
      \ }
" }}}
" Shougo/denite.nvim {{{
call catppuccin_frappe_redux#highlight('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call catppuccin_frappe_redux#highlight('deniteInput', s:palette.green, s:palette.bg4, 'bold')
call catppuccin_frappe_redux#highlight('deniteStatusLineNumber', s:palette.purple, s:palette.bg4)
call catppuccin_frappe_redux#highlight('deniteStatusLinePath', s:palette.fg0, s:palette.bg4)
highlight! link deniteSelectedLin Green
" }}}
" kien/ctrlp.vim {{{
call catppuccin_frappe_redux#highlight('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('CtrlPPrtBase', s:palette.bg4, s:palette.none)
call catppuccin_frappe_redux#highlight('CtrlPLinePre', s:palette.bg4, s:palette.none)
call catppuccin_frappe_redux#highlight('CtrlPMode1', s:palette.blue, s:palette.bg4, 'bold')
call catppuccin_frappe_redux#highlight('CtrlPMode2', s:palette.bg0, s:palette.blue, 'bold')
call catppuccin_frappe_redux#highlight('CtrlPStats', s:palette.grey2, s:palette.bg4, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" airblade/vim-gitgutter {{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
highlight! link GitGutterAddLine DiffAdd
highlight! link GitGutterChangeLine DiffChange
highlight! link GitGutterDeleteLine DiffDelete
highlight! link GitGutterChangeDeleteLine DiffChange
highlight! link GitGutterAddLineNr Green
highlight! link GitGutterChangeLineNr Blue
highlight! link GitGutterDeleteLineNr Red
highlight! link GitGutterChangeDeleteLineNr Purple
" }}}
" mhinz/vim-signify {{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
highlight! link SignifyLineAdd DiffAdd
highlight! link SignifyLineChange DiffChange
highlight! link SignifyLineChangeDelete DiffChange
highlight! link SignifyLineDelete DiffDelete
" }}}
" andymass/vim-matchup {{{
call catppuccin_frappe_redux#highlight('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MatchWord', s:palette.none, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Grey
" }}}
" justinmk/vim-sneak {{{
call catppuccin_frappe_redux#highlight('SneakLabelMask', s:palette.bg_green, s:palette.bg_green)
highlight! link Sneak Search
highlight! link SneakLabel Search
highlight! link SneakScope DiffText
" }}}
" rhysd/clever-f.vim {{{
highlight! link CleverFDefaultLabel Search
" }}}
" terryma/vim-multiple-cursors {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi {{{
call catppuccin_frappe_redux#highlight('VMCursor', s:palette.blue, s:palette.bg5)
let g:VM_Mono_hl = 'VMCursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'VMCursor'
let g:VM_Insert_hl = 'VMCursor'
" }}}
" dominikduda/vim_current_word {{{
highlight! link CurrentWordTwins CurrentWord
" }}}
" RRethy/vim-illuminate {{{
highlight! link illuminatedWord CurrentWord
highlight! link IlluminatedWordText CurrentWord
highlight! link IlluminatedWordRead CurrentWord
highlight! link IlluminatedWordWrite CurrentWord
" }}}
" itchyny/vim-cursorword {{{
highlight! link CursorWord0 CurrentWord
highlight! link CursorWord1 CurrentWord
" }}}
" Yggdroot/indentLine {{{
if s:configuration.ui_contrast ==# 'low'
  let g:indentLine_color_gui = s:palette.bg5[0]
  let g:indentLine_color_term = s:palette.bg5[1]
else
  let g:indentLine_color_gui = s:palette.grey0[0]
  let g:indentLine_color_term = s:palette.grey0[1]
endif
" }}}
" nathanaelkane/vim-indent-guides {{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call catppuccin_frappe_redux#highlight('IndentGuidesOdd', s:palette.bg0, s:palette.bg2)
  call catppuccin_frappe_redux#highlight('IndentGuidesEven', s:palette.bg0, s:palette.bg3)
endif
" }}}
" thiagoalessio/rainbow_levels.vim {{{
highlight! link RainbowLevel0 Red
highlight! link RainbowLevel1 Orange
highlight! link RainbowLevel2 Yellow
highlight! link RainbowLevel3 Green
highlight! link RainbowLevel4 Aqua
highlight! link RainbowLevel5 Blue
highlight! link RainbowLevel6 Purple
highlight! link RainbowLevel7 Yellow
highlight! link RainbowLevel8 Green
" }}}
" HiPhish/rainbow-delimiters.nvim {{{
highlight! link RainbowDelimiterRed Red
highlight! link RainbowDelimiterYellow Yellow
highlight! link RainbowDelimiterBlue Blue
highlight! link RainbowDelimiterOrange Orange
highlight! link RainbowDelimiterGreen Green
highlight! link RainbowDelimiterViolet Purple
highlight! link RainbowDelimiterCyan Aqua
" }}}
" luochen1990/rainbow {{{
if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs = [['blue', s:palette.blue[0]], ['magenta', s:palette.purple[0]],
        \ ['red', s:palette.red[0]], ['166', s:palette.orange[0]]]
endif

let g:rainbow_guifgs = [ s:palette.orange[0], s:palette.red[0], s:palette.purple[0], s:palette.blue[0] ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs
" }}}
" kshenoy/vim-signature {{{
highlight! link SignatureMarkText BlueSign
highlight! link SignatureMarkerText PurpleSign
" }}}
" ap/vim-buftabline {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" liuchengxu/vim-which-key {{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Yellow
highlight! link WhichKeyDesc Blue
" }}}
" junegunn/limelight.vim {{{
let g:limelight_conceal_ctermfg = s:palette.grey0[1]
let g:limelight_conceal_guifg = s:palette.grey0[0]
" }}}
" unblevable/quick-scope {{{
call catppuccin_frappe_redux#highlight('QuickScopePrimary', s:palette.aqua, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Grey
" }}}
" cohama/agit.vim {{{
highlight! link agitTree Grey
highlight! link agitDate Green
highlight! link agitRemote Red
highlight! link agitHead Orange
highlight! link agitRef Aqua
highlight! link agitTag Orange
highlight! link agitStatFile Blue
highlight! link agitStatRemoved Red
highlight! link agitStatAdded Green
highlight! link agitStatMessage Orange
highlight! link agitDiffRemove Red
highlight! link agitDiffAdd Green
highlight! link agitDiffHeader Purple
" }}}
" voldikss/vim-floaterm {{{
highlight! link FloatermBorder Grey
" }}}
" MattesGroeger/vim-bookmarks {{{
highlight! link BookmarkSign BlueSign
highlight! link BookmarkAnnotationSign GreenSign
highlight! link BookmarkLine DiffChange
highlight! link BookmarkAnnotationLine DiffAdd
" }}}
if has('nvim')
" hrsh7th/nvim-cmp {{{
call catppuccin_frappe_redux#highlight('CmpItemAbbrMatch', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('CmpItemAbbrMatchFuzzy', s:palette.green, s:palette.none, 'bold')
highlight! link CmpItemAbbr Fg
highlight! link CmpItemAbbrDeprecated Grey
highlight! link CmpItemMenu Fg
highlight! link CmpItemKind Yellow
for kind in g:catppuccin_frappe_redux_lsp_kind_color
  execute "highlight! link CmpItemKind" . kind[0] . " " . kind[1]
endfor
" }}}
" SmiteshP/nvim-navic {{{
highlight! link NavicText Fg
highlight! link NavicSeparator Grey
for kind in g:catppuccin_frappe_redux_lsp_kind_color
  execute "highlight! link NavicIcons" . kind[0] . " " . kind[1]
endfor
" }}}
" folke/trouble.nvim {{{
highlight! link TroubleText Fg
highlight! link TroubleSource Grey
highlight! link TroubleCode Grey
" }}}
" nvim-telescope/telescope.nvim {{{
call catppuccin_frappe_redux#highlight('TelescopeMatching', s:palette.green, s:palette.none, 'bold')
highlight! link TelescopeBorder Grey
highlight! link TelescopePromptPrefix Orange
highlight! link TelescopeSelection DiffAdd
" }}}
" lewis6991/gitsigns.nvim {{{
highlight! link GitSignsAdd GreenSign
highlight! link GitSignsChange BlueSign
highlight! link GitSignsDelete RedSign
highlight! link GitSignsAddNr Green
highlight! link GitSignsChangeNr Blue
highlight! link GitSignsDeleteNr Red
highlight! link GitSignsAddLn DiffAdd
highlight! link GitSignsChangeLn DiffChange
highlight! link GitSignsDeleteLn DiffDelete
highlight! link GitSignsCurrentLineBlame Grey
" }}}
" phaazon/hop.nvim {{{
call catppuccin_frappe_redux#highlight('HopNextKey', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('HopNextKey1', s:palette.green, s:palette.none, 'bold')
highlight! link HopNextKey2 Green
highlight! link HopUnmatched Grey
" }}}
" lukas-reineke/indent-blankline.nvim {{{
call catppuccin_frappe_redux#highlight('IblScope', s:palette.grey1, s:palette.none, 'nocombine')
call catppuccin_frappe_redux#highlight('IblIndent', s:palette.bg5, s:palette.none, 'nocombine')
highlight! link IndentBlanklineContextChar IblScope
highlight! link IndentBlanklineChar IblIndent
highlight! link IndentBlanklineSpaceChar IndentBlanklineChar
highlight! link IndentBlanklineSpaceCharBlankline IndentBlanklineChar
" }}}
" p00f/nvim-ts-rainbow {{{
highlight! link rainbowcol1 Red
highlight! link rainbowcol2 Orange
highlight! link rainbowcol3 Yellow
highlight! link rainbowcol4 Green
highlight! link rainbowcol5 Aqua
highlight! link rainbowcol6 Blue
highlight! link rainbowcol7 Purple
" }}}
" romgrk/barbar.nvim {{{
call catppuccin_frappe_redux#highlight('BufferCurrent', s:palette.fg1, s:palette.bg0)
call catppuccin_frappe_redux#highlight('BufferCurrentIndex', s:palette.fg1, s:palette.bg0)
call catppuccin_frappe_redux#highlight('BufferCurrentMod', s:palette.blue, s:palette.bg0)
call catppuccin_frappe_redux#highlight('BufferCurrentSign', s:palette.grey2, s:palette.bg0)
call catppuccin_frappe_redux#highlight('BufferCurrentTarget', s:palette.red, s:palette.bg0, 'bold')
call catppuccin_frappe_redux#highlight('BufferVisible', s:palette.fg1, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferVisibleIndex', s:palette.fg1, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferVisibleMod', s:palette.blue, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferVisibleSign', s:palette.grey2, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferVisibleTarget', s:palette.yellow, s:palette.bg_dim, 'bold')
call catppuccin_frappe_redux#highlight('BufferInactive', s:palette.grey1, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferInactiveIndex', s:palette.grey1, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferInactiveMod', s:palette.grey1, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferInactiveSign', s:palette.grey0, s:palette.bg_dim)
call catppuccin_frappe_redux#highlight('BufferInactiveTarget', s:palette.yellow, s:palette.bg_dim, 'bold')
call catppuccin_frappe_redux#highlight('BufferTabpages', s:palette.grey1, s:palette.bg_dim, 'bold')
call catppuccin_frappe_redux#highlight('BufferTabpageFill', s:palette.bg_dim, s:palette.bg_dim)
" }}}
" rcarriga/nvim-notify {{{
call catppuccin_frappe_redux#highlight('NotifyBackground', s:palette.none, s:palette.bg0)
highlight! link NotifyERRORBorder Red
highlight! link NotifyWARNBorder Yellow
highlight! link NotifyINFOBorder Green
highlight! link NotifyDEBUGBorder Grey
highlight! link NotifyTRACEBorder Purple
highlight! link NotifyERRORIcon Red
highlight! link NotifyWARNIcon Yellow
highlight! link NotifyINFOIcon Green
highlight! link NotifyDEBUGIcon Grey
highlight! link NotifyTRACEIcon Purple
highlight! link NotifyERRORTitle Red
highlight! link NotifyWARNTitle Yellow
highlight! link NotifyINFOTitle Green
highlight! link NotifyDEBUGTitle Grey
highlight! link NotifyTRACETitle Purple
" }}}
" rcarriga/nvim-dap-ui {{{
call catppuccin_frappe_redux#highlight('DapUIModifiedValue', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('DapUIBreakpointsCurrentLine', s:palette.blue, s:palette.none, 'bold')
highlight! link DapUIScope Blue
highlight! link DapUIType Purple
highlight! link DapUIDecoration Blue
highlight! link DapUIThread Green
highlight! link DapUIStoppedThread Blue
highlight! link DapUISource Purple
highlight! link DapUILineNumber Blue
highlight! link DapUIFloatBorder Blue
highlight! link DapUIWatchesEmpty Red
highlight! link DapUIWatchesValue Green
highlight! link DapUIWatchesError Red
highlight! link DapUIBreakpointsPath Blue
highlight! link DapUIBreakpointsInfo Green
" }}}
" glepnir/lspsaga.nvim {{{
call catppuccin_frappe_redux#highlight('LspFloatWinBorder', s:palette.bg0, s:palette.bg0)
call catppuccin_frappe_redux#highlight('LspSagaDiagnosticHeader', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('LspSagaCodeActionTitle', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('DefinitionPreviewTitle', s:palette.blue, s:palette.none, 'bold')
highlight! link LspSagaDiagnosticError Red
highlight! link LspSagaDiagnosticWarn Yellow
highlight! link LspSagaDiagnosticInfo Blue
highlight! link LspSagaDiagnosticHint Green
highlight! link LspSagaErrorTrunCateLine LspSagaDiagnosticError
highlight! link LspSagaWarnTrunCateLine LspSagaDiagnosticWarn
highlight! link LspSagaInfoTrunCateLine LspSagaDiagnosticInfo
highlight! link LspSagaHintTrunCateLine LspSagaDiagnosticHint
highlight! link LspSagaDiagnosticSource Orange
highlight! link LspSagaDiagnosticBorder Orange
highlight! link LspSagaRenameBorder Purple
highlight! link LspSagaRenamePromptPrefix Blue
highlight! link LspSagaCodeActionBorder Purple
highlight! link LspSagaCodeActionTruncateLine Purple
highlight! link LspSagaCodeActionContent Green
highlight! link LspSagaHoverBorder Green
highlight! link LspSagaDocTruncateLine Green
highlight! link LspSagaSignatureHelpBorder Green
highlight! link LspSagaShTruncateLine Green
highlight! link LspSagaDefPreviewBorder Blue
highlight! link DefinitionIcon Blue
highlight! link LspLinesDiagBorder Yellow
highlight! link LineDiagTuncateLine Yellow
highlight! link LspSagaAutoPreview Green
highlight! link LspSagaFinderSelection Fg
highlight! link DiagnosticWarning DiagnosticWarn
highlight! link DiagnosticInformation DiagnosticInfo
highlight! link ReferencesCount Grey
highlight! link DefinitionCount Grey
highlight! link TargetFileName Grey
" }}}
" b0o/incline.nvim {{{
call catppuccin_frappe_redux#highlight('InclineNormalNC', s:palette.grey1, s:palette.bg3)
" }}}
" echasnovski/mini.nvim {{{
call catppuccin_frappe_redux#highlight('MiniAnimateCursor', s:palette.none, s:palette.none, 'reverse,nocombine')
call catppuccin_frappe_redux#highlight('MiniFilesFile', s:palette.fg1, s:palette.none)
if s:configuration.float_style ==# 'dim'
  call catppuccin_frappe_redux#highlight('MiniFilesTitleFocused', s:palette.green, s:palette.bg_dim, 'bold')
else
  call catppuccin_frappe_redux#highlight('MiniFilesTitleFocused', s:palette.green, s:palette.bg3, 'bold')
endif
call catppuccin_frappe_redux#highlight('MiniHipatternsFixme', s:palette.bg0, s:palette.red, 'bold')
call catppuccin_frappe_redux#highlight('MiniHipatternsHack', s:palette.bg0, s:palette.yellow, 'bold')
call catppuccin_frappe_redux#highlight('MiniHipatternsNote', s:palette.bg0, s:palette.blue, 'bold')
call catppuccin_frappe_redux#highlight('MiniHipatternsTodo', s:palette.bg0, s:palette.green, 'bold')
call catppuccin_frappe_redux#highlight('MiniIconsAzure', s:palette.blue, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsBlue', s:palette.blue, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsCyan', s:palette.aqua, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsGreen', s:palette.green, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsGrey', s:palette.fg1, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsOrange', s:palette.orange, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsPurple', s:palette.purple, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsRed', s:palette.red, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIconsYellow', s:palette.yellow, s:palette.none)
call catppuccin_frappe_redux#highlight('MiniIndentscopePrefix', s:palette.none, s:palette.none, 'nocombine')
call catppuccin_frappe_redux#highlight('MiniJump2dSpot', s:palette.orange, s:palette.none, 'bold,nocombine')
call catppuccin_frappe_redux#highlight('MiniJump2dSpotAhead', s:palette.aqua, s:palette.none, 'nocombine')
call catppuccin_frappe_redux#highlight('MiniJump2dSpotUnique', s:palette.yellow, s:palette.none, 'bold,nocombine')
if s:configuration.float_style ==# 'dim'
  call catppuccin_frappe_redux#highlight('MiniPickPrompt', s:palette.blue, s:palette.bg_dim)
else
  call catppuccin_frappe_redux#highlight('MiniPickPrompt', s:palette.blue, s:palette.bg3)
endif
call catppuccin_frappe_redux#highlight('MiniStarterCurrent', s:palette.none, s:palette.none, 'nocombine')
call catppuccin_frappe_redux#highlight('MiniStatuslineDevinfo', s:palette.grey2, s:palette.bg_statusline2)
call catppuccin_frappe_redux#highlight('MiniStatuslineFileinfo', s:palette.grey2, s:palette.bg_statusline2)
call catppuccin_frappe_redux#highlight('MiniStatuslineFilename', s:palette.grey2, s:palette.bg_statusline1)
call catppuccin_frappe_redux#highlight('MiniStatuslineInactive', s:palette.grey2, s:palette.bg_statusline1)
call catppuccin_frappe_redux#highlight('MiniStatuslineModeCommand', s:palette.bg0, s:palette.blue, 'bold')
call catppuccin_frappe_redux#highlight('MiniStatuslineModeInsert', s:palette.bg0, s:palette.bg_green, 'bold')
call catppuccin_frappe_redux#highlight('MiniStatuslineModeNormal', s:palette.bg0, s:palette.grey2, 'bold')
call catppuccin_frappe_redux#highlight('MiniStatuslineModeOther', s:palette.bg0, s:palette.purple, 'bold')
call catppuccin_frappe_redux#highlight('MiniStatuslineModeReplace', s:palette.bg0, s:palette.bg_yellow, 'bold')
call catppuccin_frappe_redux#highlight('MiniStatuslineModeVisual', s:palette.bg0, s:palette.bg_red, 'bold')
call catppuccin_frappe_redux#highlight('MiniTablineCurrent', s:palette.fg1, s:palette.bg5)
call catppuccin_frappe_redux#highlight('MiniTablineHidden', s:palette.grey1, s:palette.bg3)
call catppuccin_frappe_redux#highlight('MiniTablineModifiedCurrent', s:palette.blue, s:palette.bg5)
call catppuccin_frappe_redux#highlight('MiniTablineModifiedHidden', s:palette.grey1, s:palette.bg3)
call catppuccin_frappe_redux#highlight('MiniTablineModifiedVisible', s:palette.blue, s:palette.bg3)
call catppuccin_frappe_redux#highlight('MiniTablineTabpagesection', s:palette.bg0, s:palette.grey2, 'bold')
call catppuccin_frappe_redux#highlight('MiniTablineVisible', s:palette.fg1, s:palette.bg3)
call catppuccin_frappe_redux#highlight('MiniTestEmphasis', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MiniTestFail', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MiniTestPass', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('MiniTrailspace', s:palette.none, s:palette.red)
highlight! link MiniAnimateNormalFloat NormalFloat
highlight! link MiniClueBorder FloatBorder
highlight! link MiniClueDescGroup DiagnosticFloatingWarn
highlight! link MiniClueDescSingle NormalFloat
highlight! link MiniClueNextKey DiagnosticFloatingHint
highlight! link MiniClueNextKeyWithPostkeys DiagnosticFloatingError
highlight! link MiniClueSeparator DiagnosticFloatingInfo
highlight! link MiniClueTitle FloatTitle
highlight! link MiniCompletionActiveParameter LspSignatureActiveParameter
highlight! link MiniCursorword CurrentWord
highlight! link MiniCursorwordCurrent CurrentWord
highlight! link MiniDepsChangeAdded diffAdded
highlight! link MiniDepsChangeRemoved diffRemoved
highlight! link MiniDepsHint DiagnosticHint
highlight! link MiniDepsInfo DiagnosticInfo
highlight! link MiniDepsMsgBreaking DiagnosticWarn
highlight! link MiniDepsPlaceholder Comment
highlight! link MiniDepsTitle Title
highlight! link MiniDepsTitleError DiffDelete
highlight! link MiniDepsTitleSame DiffChange
highlight! link MiniDepsTitleUpdate DiffAdd
highlight! link MiniDiffOverAdd DiffAdd
highlight! link MiniDiffOverChange DiffText
highlight! link MiniDiffOverContext DiffChange
highlight! link MiniDiffOverDelete DiffDelete
highlight! link MiniDiffSignAdd GreenSign
highlight! link MiniDiffSignChange BlueSign
highlight! link MiniDiffSignDelete RedSign
highlight! link MiniFilesBorder FloatBorder
highlight! link MiniFilesBorderModified DiagnosticFloatingWarn
highlight! link MiniFilesCursorLine CursorLine
highlight! link MiniFilesDirectory Directory
highlight! link MiniFilesNormal NormalFloat
highlight! link MiniFilesTitle FloatTitle
highlight! link MiniIndentscopeSymbol Grey
highlight! link MiniJump Search
highlight! link MiniJump2dDim Comment
highlight! link MiniMapNormal NormalFloat
highlight! link MiniMapSymbolCount Special
highlight! link MiniMapSymbolLine Title
highlight! link MiniMapSymbolView Delimiter
highlight! link MiniNotifyBorder FloatBorder
highlight! link MiniNotifyNormal NormalFloat
highlight! link MiniNotifyTitle FloatTitle
highlight! link MiniOperatorsExchangeFrom IncSearch
highlight! link MiniPickBorder FloatBorder
highlight! link MiniPickBorderBusy DiagnosticFloatingWarn
highlight! link MiniPickBorderText FloatTitle
highlight! link MiniPickHeader DiagnosticFloatingHint
highlight! link MiniPickIconDirectory Directory
highlight! link MiniPickIconFile MiniPickNormal
highlight! link MiniPickMatchCurrent CursorLine
highlight! link MiniPickMatchMarked DiffChange
highlight! link MiniPickMatchRanges DiagnosticFloatingHint
highlight! link MiniPickNormal NormalFloat
highlight! link MiniPickPreviewLine CursorLine
highlight! link MiniPickPreviewRegion IncSearch
highlight! link MiniStarterFooter Orange
highlight! link MiniStarterHeader Yellow
highlight! link MiniStarterInactive Comment
highlight! link MiniStarterItem Normal
highlight! link MiniStarterItemBullet Grey
highlight! link MiniStarterItemPrefix Yellow
highlight! link MiniStarterQuery Blue
highlight! link MiniStarterSection Title
highlight! link MiniSurround IncSearch
highlight! link MiniTablineFill TabLineFill
" }}}
" ggandor/lightspeed.nvim {{{
call catppuccin_frappe_redux#highlight('LightspeedLabel', s:palette.red, s:palette.none, 'bold,underline')
call catppuccin_frappe_redux#highlight('LightspeedLabelDistant', s:palette.blue, s:palette.none, 'bold,underline')
call catppuccin_frappe_redux#highlight('LightspeedShortcut', s:palette.bg0, s:palette.red, 'bold')
call catppuccin_frappe_redux#highlight('LightspeedUnlabeledMatch', s:palette.fg0, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('LightspeedPendingOpArea', s:palette.bg0, s:palette.green)
highlight! link LightspeedMaskedChar Purple
highlight! link LightspeedGreyWash Grey
" }}}
" nvim-neotest/neotest {{{
highlight! link NeotestPassed GreenSign
highlight! link NeotestFailed RedSign
highlight! link NeotestRunning YellowSign
highlight! link NeotestSkipped BlueSign
" }}}
endif
" }}}
" Extended File Types: {{{
" Whitelist: {{{ File type optimizations that will always be loaded.
" diff {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Aqua
highlight! link diffLine Grey
highlight! link diffIndexLine Purple
" }}}
" }}}
" Generate the `after/syntax` directory based on the comment tags in this file.
" For example, the content between `syn_begin: sh/zsh` and `syn_end` will be placed in `after/syntax/sh/catppuccin_frappe_redux.vim` and `after/syntax/zsh/catppuccin_frappe_redux.vim`.
if catppuccin_frappe_redux#syn_exists(s:path) " If the syntax files exist.
  if s:configuration.better_performance
    if !catppuccin_frappe_redux#syn_newest(s:path, s:last_modified) " Regenerate if it's not up to date.
      call catppuccin_frappe_redux#syn_clean(s:path, 0)
      call catppuccin_frappe_redux#syn_gen(s:path, s:last_modified, 'update')
    endif
    finish
  else
    call catppuccin_frappe_redux#syn_clean(s:path, 1)
  endif
else
  if s:configuration.better_performance
    call catppuccin_frappe_redux#syn_gen(s:path, s:last_modified, 'generate')
    finish
  endif
endif
" syn_begin: vim-plug {{{
" https://gitlab.com/junegunn/vim-plug
call catppuccin_frappe_redux#highlight('plug1', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('plugNumber', s:palette.yellow, s:palette.none, 'bold')
highlight! link plug2 Green
highlight! link plugBracket Grey
highlight! link plugName Aqua
highlight! link plugDash Orange
highlight! link plugError Red
highlight! link plugNotLoaded Grey
highlight! link plugRelDate Grey
highlight! link plugH2 Orange
highlight! link plugMessage Orange
highlight! link plugStar Red
highlight! link plugUpdate Blue
highlight! link plugDeleted Grey
highlight! link plugEdge Yellow
highlight! link plugSha Green
" syn_end }}}
" syn_begin: packer {{{
" https://gitlab.com/wbthomason/packer.nvim
highlight! link packerSuccess Aqua
highlight! link packerFail Red
highlight! link packerStatusSuccess Fg
highlight! link packerStatusFail Fg
highlight! link packerWorking Yellow
highlight! link packerString Yellow
highlight! link packerPackageNotLoaded Grey
highlight! link packerRelDate Grey
highlight! link packerPackageName Green
highlight! link packerOutput Orange
highlight! link packerHash Green
highlight! link packerTimeTrivial Blue
highlight! link packerTimeHigh Red
highlight! link packerTimeMedium Yellow
highlight! link packerTimeLow Green
" syn_end }}}
" syn_begin: coctree {{{
" https://gitlab.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Aqua
highlight! link CocTreeDescription Grey
for kind in g:catppuccin_frappe_redux_lsp_kind_color
  execute "highlight! link CocSymbol" . kind[0] . " " . kind[1]
endfor
" syn_end }}}
" syn_begin: coc-explorer {{{
" https://gitlab.com/weirongxu/coc-explorer
highlight! link CocExplorerBufferRoot Orange
highlight! link CocExplorerBufferExpandIcon Aqua
highlight! link CocExplorerBufferBufnr Purple
highlight! link CocExplorerBufferModified Yellow
highlight! link CocExplorerBufferReadonly Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Orange
highlight! link CocExplorerFileRootName Green
highlight! link CocExplorerFileExpandIcon Aqua
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStaged Purple
highlight! link CocExplorerFileGitUnstaged Yellow
highlight! link CocExplorerFileGitRootStaged Purple
highlight! link CocExplorerFileGitRootUnstaged Yellow
highlight! link CocExplorerGitPathChange Fg
highlight! link CocExplorerGitContentChange Fg
highlight! link CocExplorerGitRenamed Purple
highlight! link CocExplorerGitCopied Fg
highlight! link CocExplorerGitAdded Green
highlight! link CocExplorerGitUntracked Blue
highlight! link CocExplorerGitUnmodified Fg
highlight! link CocExplorerGitUnmerged Orange
highlight! link CocExplorerGitMixed Aqua
highlight! link CocExplorerGitModified Yellow
highlight! link CocExplorerGitDeleted Red
highlight! link CocExplorerGitIgnored Grey
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Aqua
highlight! link CocExplorerTimeCreated Aqua
highlight! link CocExplorerTimeModified Aqua
highlight! link CocExplorerIndentLine Conceal
highlight! link CocExplorerHelpDescription Grey
highlight! link CocExplorerHelpHint Grey
highlight! link CocExplorerDiagnosticError Red
highlight! link CocExplorerDiagnosticWarning Yellow
highlight! link CocExplorerFileHidden Grey
" syn_end }}}
" syn_begin: tagbar {{{
" https://gitlab.com/majutsushi/tagbar
highlight! link TagbarFoldIcon Green
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Orange
highlight! link TagbarNestedKind Aqua
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" syn_end }}}
" syn_begin: vista/vista_kind/vista_markdown {{{
" https://gitlab.com/liuchengxu/vista.vim
highlight! link VistaBracket Grey
highlight! link VistaChildrenNr Orange
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Grey
highlight! link VistaIcon Orange
highlight! link VistaScopeKind Yellow
highlight! link VistaColon Grey
highlight! link VistaLineNr Grey
highlight! link VistaHeadNr Fg
highlight! link VistaPublic Green
highlight! link VistaProtected Yellow
highlight! link VistaPrivate Red
" syn_end }}}
" syn_begin: Outline {{{
" https://gitlab.com/simrat39/symbols-outline.nvim
highlight! link FocusedSymbol NormalFloat
" syn_end }}}
" syn_begin: aerial {{{
" https://gitlab.com/stevearc/aerial.nvim
highlight! link AerialLine CursorLine
highlight! link AerialGuide LineNr
for kind in g:catppuccin_frappe_redux_lsp_kind_color
  execute "highlight! link Aerial" . kind[0] . "Icon " . kind[1]
endfor
" syn_end }}}
" syn_begin: nerdtree {{{
" https://gitlab.com/preservim/nerdtree
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Aqua
highlight! link NERDTreeOpenable Orange
highlight! link NERDTreeClosable Orange
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Yellow
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Aqua
highlight! link NERDTreeHelp LightGrey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Orange
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" syn_end }}}
" syn_begin: dirvish {{{
" https://gitlab.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Aqua
highlight! link DirvishArg Yellow
" syn_end }}}
" syn_begin: NvimTree {{{
" https://gitlab.com/kyazdani42/nvim-tree.lua
if !s:configuration.transparent_background
  call catppuccin_frappe_redux#highlight('NvimTreeNormal', s:palette.fg0, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('NvimTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('NvimTreeVertSplit', s:palette.bg0, s:palette.bg0)
  call catppuccin_frappe_redux#highlight('NvimTreeCursorLine', s:palette.none, s:palette.bg0)
endif
highlight! link NvimTreeSymlink Fg
highlight! link NvimTreeFolderName Green
highlight! link NvimTreeRootFolder Grey
highlight! link NvimTreeFolderIcon Orange
highlight! link NvimTreeEmptyFolderName Green
highlight! link NvimTreeOpenedFolderName Green
highlight! link NvimTreeExecFile Fg
highlight! link NvimTreeOpenedFile Fg
highlight! link NvimTreeSpecialFile Fg
highlight! link NvimTreeImageFile Fg
highlight! link NvimTreeMarkdownFile Fg
highlight! link NvimTreeIndentMarker Grey
highlight! link NvimTreeGitDirty Yellow
highlight! link NvimTreeGitStaged Blue
highlight! link NvimTreeGitMerge Orange
highlight! link NvimTreeGitRenamed Purple
highlight! link NvimTreeGitNew Aqua
highlight! link NvimTreeGitDeleted Red
highlight! link NvimTreeLspDiagnosticsError RedSign
highlight! link NvimTreeLspDiagnosticsWarning YellowSign
highlight! link NvimTreeLspDiagnosticsInformation BlueSign
highlight! link NvimTreeLspDiagnosticsHint GreenSign
" syn_end }}}
" syn_begin: fern {{{
" https://gitlab.com/lambdalisue/fern.vim
highlight! link FernMarkedLine Purple
highlight! link FernMarkedText Purple
highlight! link FernRootSymbol FernRootText
highlight! link FernRootText Orange
highlight! link FernLeafSymbol FernLeafText
highlight! link FernLeafText Fg
highlight! link FernBranchSymbol FernBranchText
highlight! link FernBranchText Green
highlight! link FernWindowSelectIndicator TabLineSel
highlight! link FernWindowSelectStatusLine TabLine
" syn_end }}}
" syn_begin: neo-tree {{{
" https://gitlab.com/nvim-neo-tree/neo-tree.nvim
if !s:configuration.transparent_background
  call catppuccin_frappe_redux#highlight('NeoTreeNormal', s:palette.fg0, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('NeoTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call catppuccin_frappe_redux#highlight('NeoTreeVertSplit', s:palette.bg0, s:palette.bg0)
endif
highlight! link NeoTreeDirectoryIcon Orange
highlight! link NeoTreeGitAdded Green
highlight! link NeoTreeGitConflict Yellow
highlight! link NeoTreeGitDeleted Red
highlight! link NeoTreeGitIgnored Grey
highlight! link NeoTreeGitModified Blue
highlight! link NeoTreeGitUnstaged Purple
highlight! link NeoTreeGitUntracked Fg
highlight! link NeoTreeGitStaged Purple
highlight! link NeoTreeDimText Grey
highlight! link NeoTreeIndentMarker NonText
highlight! link NeoTreeNormalNC NeoTreeNormal
highlight! link NeoTreeSignColumn NeoTreeNormal
highlight! link NeoTreeRootName Title
" syn_end }}}
" syn_begin: octo {{{
" https://gitlab.com/pwntester/octo.nvim
call catppuccin_frappe_redux#highlight('OctoViewer', s:palette.bg0, s:palette.blue)
call catppuccin_frappe_redux#highlight('OctoGreenFloat', s:palette.green, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoRedFloat', s:palette.red, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoPurpleFloat', s:palette.purple, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoYellowFloat', s:palette.yellow, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoBlueFloat', s:palette.blue, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoGreyFloat', s:palette.grey1, s:palette.bg3)
call catppuccin_frappe_redux#highlight('OctoBubbleGreen', s:palette.bg0, s:palette.green)
call catppuccin_frappe_redux#highlight('OctoBubbleRed', s:palette.bg0, s:palette.red)
call catppuccin_frappe_redux#highlight('OctoBubblePurple', s:palette.bg0, s:palette.purple)
call catppuccin_frappe_redux#highlight('OctoBubbleYellow', s:palette.bg0, s:palette.yellow)
call catppuccin_frappe_redux#highlight('OctoBubbleBlue', s:palette.bg0, s:palette.blue)
call catppuccin_frappe_redux#highlight('OctoBubbleGrey', s:palette.bg0, s:palette.grey1)
highlight! link OctoGreen Green
highlight! link OctoRed Red
highlight! link OctoPurple Purple
highlight! link OctoYellow Yellow
highlight! link OctoBlue Blue
highlight! link OctoGrey Grey
highlight! link OctoBubbleDelimiterGreen Green
highlight! link OctoBubbleDelimiterRed Red
highlight! link OctoBubbleDelimiterPurple Purple
highlight! link OctoBubbleDelimiterYellow Yellow
highlight! link OctoBubbleDelimiterBlue Blue
highlight! link OctoBubbleDelimiterGrey Grey
" syn_end }}}
" syn_begin: netrw {{{
" https://www.vim.org/scripts/script.php?script_id=1075
highlight! link netrwDir Green
highlight! link netrwClassify Green
highlight! link netrwLink Grey
highlight! link netrwSymLink Fg
highlight! link netrwExe Yellow
highlight! link netrwComment Grey
highlight! link netrwList Aqua
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Grey
highlight! link netrwVersion Orange
" syn_end }}}
" syn_begin: startify/quickmenu {{{
" https://gitlab.com/mhinz/vim-startify
" https://gitlab.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Red
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Yellow
highlight! link StartifyHeader Orange
highlight! link StartifySpecial Grey
highlight! link StartifyFooter Grey
" syn_end }}}
" syn_begin: quickmenu {{{
" https://gitlab.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Green
highlight! link QuickmenuSpecial Purple
highlight! link QuickmenuHeader Orange
" syn_end }}}
" syn_begin: undotree {{{
" https://gitlab.com/mbbill/undotree
call catppuccin_frappe_redux#highlight('UndotreeSavedBig', s:palette.purple, s:palette.none, 'bold')
highlight! link UndotreeNode Orange
highlight! link UndotreeNodeCurrent Red
highlight! link UndotreeSeq Green
highlight! link UndotreeNext Blue
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Yellow
highlight! link UndotreeBranch Yellow
highlight! link UndotreeCurrent Aqua
highlight! link UndotreeSavedSmall Purple
" syn_end }}}
" syn_begin: NeogitStatus/NeogitCommitView {{{
" https://gitlab.com/TimUntersberger/neogit
highlight! link NeogitNotificationInfo Blue
highlight! link NeogitNotificationWarning Yellow
highlight! link NeogitNotificationError Red
highlight! link NeogitDiffAdd Green
highlight! link NeogitDiffDelete Red
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link NeogitHunkHeaderHighlight TabLine
highlight! link NeogitHunkHeader TabLineFill
highlight! link NeogitCommandCodeNormal Green
highlight! link NeogitCommandCodeError Red
highlight! link NeogitCommitViewHeader diffIndexLine
highlight! link NeogitFilePath diffFile
" syn_end }}}
" syn_begin: dashboard {{{
" https://gitlab.com/glepnir/dashboard-nvim
highlight! link DashboardHeader Yellow
highlight! link DashboardCenter Green
highlight! link DashboardShortcut Red
highlight! link DashboardFooter Orange
" syn_end }}}
" syn_begin: markdown {{{
" builtin: {{{
call catppuccin_frappe_redux#highlight('markdownH1', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownH2', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownH4', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownH5', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownH6', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownItalic', s:palette.none, s:palette.none, 'italic')
call catppuccin_frappe_redux#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('markdownItalicDelimiter', s:palette.grey1, s:palette.none, 'italic')
highlight! link markdownUrl TSURI
highlight! link markdownCode Green
highlight! link markdownCodeBlock Aqua
highlight! link markdownCodeDelimiter Aqua
highlight! link markdownBlockquote Grey
highlight! link markdownListMarker Red
highlight! link markdownOrderedListMarker Red
highlight! link markdownRule Purple
highlight! link markdownHeadingRule Grey
highlight! link markdownUrlDelimiter Grey
highlight! link markdownLinkDelimiter Grey
highlight! link markdownLinkTextDelimiter Grey
highlight! link markdownHeadingDelimiter Grey
highlight! link markdownLinkText Purple
highlight! link markdownUrlTitleDelimiter Green
highlight! link markdownIdDeclaration markdownLinkText
highlight! link markdownBoldDelimiter Grey
highlight! link markdownId Yellow
" }}}
" vim-markdown: https://gitlab.com/gabrielelana/vim-markdown {{{
call catppuccin_frappe_redux#highlight('mkdURL', s:palette.blue, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('mkdInlineURL', s:palette.purple, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('mkdItalic', s:palette.grey1, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Aqua
highlight! link mkdBold Grey
highlight! link mkdLink Purple
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" nvim-treesitter/nvim-treesitter {{{
if has('nvim-0.8')
  highlight! link @markup.heading.1.markdown markdownH1
  highlight! link @markup.heading.2.markdown markdownH2
  highlight! link @markup.heading.3.markdown markdownH3
  highlight! link @markup.heading.4.markdown markdownH4
  highlight! link @markup.heading.5.markdown markdownH5
  highlight! link @markup.heading.6.markdown markdownH6
  highlight! link @markup.heading.1.marker.markdown @conceal
  highlight! link @markup.heading.2.marker.markdown @conceal
  highlight! link @markup.heading.3.marker.markdown @conceal
  highlight! link @markup.heading.4.marker.markdown @conceal
  highlight! link @markup.heading.5.marker.markdown @conceal
  highlight! link @markup.heading.6.marker.markdown @conceal
  if !has('nvim-0.10')
    call catppuccin_frappe_redux#highlight('@markup.italic', s:palette.none, s:palette.none, 'italic')
    call catppuccin_frappe_redux#highlight('@markup.strikethrough', s:palette.none, s:palette.none, 'strikethrough')
  endif
endif
" }}}
" syn_end }}}
" syn_begin: vimwiki {{{
call catppuccin_frappe_redux#highlight('VimwikiHeader1', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiHeader2', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiHeader3', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiHeader4', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiHeader5', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiHeader6', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiLink', s:palette.blue, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('VimwikiItalic', s:palette.none, s:palette.none, 'italic')
call catppuccin_frappe_redux#highlight('VimwikiBold', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('VimwikiUnderline', s:palette.none, s:palette.none, 'underline')
highlight! link VimwikiList Red
highlight! link VimwikiTag Aqua
highlight! link VimwikiCode Green
highlight! link VimwikiHR Yellow
highlight! link VimwikiHeaderChar Grey
highlight! link VimwikiMarkers Grey
highlight! link VimwikiPre Green
highlight! link VimwikiPreDelim Green
highlight! link VimwikiNoExistsLink Red
" syn_end }}}
" syn_begin: rst {{{
" builtin: https://gitlab.com/marshallward/vim-restructuredtext {{{
call catppuccin_frappe_redux#highlight('rstStandaloneHyperlink', s:palette.purple, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Aqua
highlight! link rstTableLines Grey
" }}}
" syn_end }}}
" syn_begin: tex {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX {{{
highlight! link texStatement Green
highlight! link texOnlyMath Grey
highlight! link texDefName Yellow
highlight! link texNewCmd Orange
highlight! link texCmdName Blue
highlight! link texBeginEnd Red
highlight! link texBeginEndName Blue
highlight! link texDocType Purple
highlight! link texDocTypeArgs Orange
highlight! link texDelimiter Conceal
" }}}
" vimtex: https://gitlab.com/lervag/vimtex {{{
highlight! link texCmd Green
highlight! link texCmdClass Purple
highlight! link texCmdTitle Purple
highlight! link texCmdAuthor Purple
highlight! link texCmdPart Purple
highlight! link texCmdBib Purple
highlight! link texCmdPackage Yellow
highlight! link texCmdNew Yellow
highlight! link texArgNew Orange
highlight! link texPartArgTitle BlueItalic
highlight! link texFileArg BlueItalic
highlight! link texEnvArgName BlueItalic
highlight! link texMathEnvArgName BlueItalic
highlight! link texTitleArg BlueItalic
highlight! link texAuthorArg BlueItalic
" }}}
" syn_end }}}
" syn_begin: html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax {{{
call catppuccin_frappe_redux#highlight('htmlH1', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlH2', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlH4', s:palette.green, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlH5', s:palette.blue, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlH6', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call catppuccin_frappe_redux#highlight('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call catppuccin_frappe_redux#highlight('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call catppuccin_frappe_redux#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call catppuccin_frappe_redux#highlight('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Green
highlight! link htmlEndTag Blue
highlight! link htmlTagN OrangeItalic
highlight! link htmlTagName OrangeItalic
highlight! link htmlArg Aqua
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName RedItalic
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link htmlTSText TSNone
if has('nvim-0.8')
  highlight! link @text.html htmlTSText
endif
" }}}
" syn_end }}}
" syn_begin: xml {{{
" builtin: https://gitlab.com/chrisbra/vim-xml-ftplugin {{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName OrangeItalic
highlight! link xmlEqual Orange
highlight! link xmlAttrib Aqua
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword PurpleItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata Purple
" }}}
" syn_end }}}
" syn_begin: css/scss/sass/less {{{
" builtin: https://gitlab.com/JulesWang/css.vim {{{
highlight! link cssAttrComma Fg
highlight! link cssBraces Fg
highlight! link cssTagName PurpleItalic
highlight! link cssClassNameDot Red
highlight! link cssClassName RedItalic
highlight! link cssFunctionName Yellow
highlight! link cssAttr Orange
highlight! link cssProp Aqua
highlight! link cssCommonAttr Yellow
highlight! link cssPseudoClassId Blue
highlight! link cssPseudoClassFn Green
highlight! link cssPseudoClass Purple
highlight! link cssImportant RedItalic
highlight! link cssSelectorOp Orange
highlight! link cssSelectorOp2 Orange
highlight! link cssColor Green
highlight! link cssAttributeSelector Aqua
highlight! link cssUnitDecorators Orange
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Grey
highlight! link cssNoise Grey
" }}}
" syn_end }}}
" syn_begin: scss {{{
" scss-syntax: https://gitlab.com/cakebaker/scss-syntax.vim {{{
highlight! link scssMixinName Yellow
highlight! link scssSelectorChar Red
highlight! link scssSelectorName RedItalic
highlight! link scssInterpolationDelimiter Green
highlight! link scssVariableValue Green
highlight! link scssNull Purple
highlight! link scssBoolean Purple
highlight! link scssVariableAssignment Grey
highlight! link scssForKeyword PurpleItalic
highlight! link scssAttribute Orange
highlight! link scssFunctionName Yellow
" }}}
" syn_end }}}
" syn_begin: sass {{{
" builtin: {{{
highlight! link sassProperty Aqua
highlight! link sassAmpersand Orange
highlight! link sassClass RedItalic
highlight! link sassClassChar Red
highlight! link sassMixing PurpleItalic
highlight! link sassMixinName Orange
highlight! link sassCssAttribute Yellow
highlight! link sassInterpolationDelimiter Green
highlight! link sassFunction Yellow
highlight! link sassControl RedItalic
highlight! link sassFor RedItalic
highlight! link sassFunctionName GreenBold
" }}}
" syn_end }}}
" syn_begin: less {{{
" vim-less: https://gitlab.com/groenewege/vim-less {{{
highlight! link lessMixinChar Grey
highlight! link lessClass RedItalic
highlight! link lessVariable Blue
highlight! link lessAmpersandChar Orange
highlight! link lessFunction Yellow
" }}}
" syn_end }}}
" syn_begin: javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim {{{
highlight! link javaScriptNull Aqua
highlight! link javaScriptIdentifier Orange
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptGlobal Purple
highlight! link javaScriptMessage Yellow
highlight! link javaScriptFunction RedItalic
highlight! link javaScriptOperator Orange
highlight! link javaScriptMember Aqua
" }}}
" vim-javascript: https://gitlab.com/pangloss/vim-javascript {{{
highlight! link jsThis Purple
highlight! link jsUndefined Aqua
highlight! link jsNull Aqua
highlight! link jsNan Aqua
highlight! link jsSuper Purple
highlight! link jsPrototype Purple
highlight! link jsFunction RedItalic
highlight! link jsGlobalNodeObjects PurpleItalic
highlight! link jsGlobalObjects Yellow
highlight! link jsArrowFunction Purple
highlight! link jsArrowFuncArgs Blue
highlight! link jsFuncArgs Blue
highlight! link jsObjectProp Aqua
highlight! link jsVariableDef Blue
highlight! link jsObjectKey Aqua
highlight! link jsParen Blue
highlight! link jsParenIfElse Blue
highlight! link jsParenRepeat Blue
highlight! link jsParenSwitch Blue
highlight! link jsParenCatch Blue
highlight! link jsBracket Blue
highlight! link jsBlockLabel Aqua
highlight! link jsFunctionKey GreenBold
highlight! link jsClassDefinition Yellow
highlight! link jsDot Grey
highlight! link jsDestructuringBlock Blue
highlight! link jsSpreadExpression Purple
highlight! link jsSpreadOperator Green
highlight! link jsModuleKeyword Yellow
highlight! link jsObjectValue Blue
highlight! link jsTemplateExpression Yellow
highlight! link jsTemplateBraces Yellow
highlight! link jsClassMethodType Orange
" }}}
" nvim-treesitter/nvim-treesitter {{{
if has('nvim-0.9')
  highlight! link @lsp.typemod.variable.defaultLibrary.javascript TSConstBuiltin
  highlight! link @lsp.typemod.variable.defaultLibrary.javascriptreact TSConstBuiltin
endif
" }}}
" yajs: https://gitlab.com/othree/yajs.vim {{{
highlight! link javascriptEndColons Fg
highlight! link javascriptOpSymbol Orange
highlight! link javascriptOpSymbols Orange
highlight! link javascriptIdentifierName Blue
highlight! link javascriptVariable Orange
highlight! link javascriptObjectLabel Aqua
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptPropertyNameString Aqua
highlight! link javascriptFuncArg Blue
highlight! link javascriptIdentifier Purple
highlight! link javascriptArrowFunc Purple
highlight! link javascriptTemplate Yellow
highlight! link javascriptTemplateSubstitution Yellow
highlight! link javascriptTemplateSB Yellow
highlight! link javascriptNodeGlobal PurpleItalic
highlight! link javascriptDocTags PurpleItalic
highlight! link javascriptDocNotation Purple
highlight! link javascriptClassSuper Purple
highlight! link javascriptClassName Yellow
highlight! link javascriptClassSuperName Yellow
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel Purple
highlight! link javascriptDotNotation Grey
highlight! link javascriptGlobalArrayDot Grey
highlight! link javascriptGlobalBigIntDot Grey
highlight! link javascriptGlobalDateDot Grey
highlight! link javascriptGlobalJSONDot Grey
highlight! link javascriptGlobalMathDot Grey
highlight! link javascriptGlobalNumberDot Grey
highlight! link javascriptGlobalObjectDot Grey
highlight! link javascriptGlobalPromiseDot Grey
highlight! link javascriptGlobalRegExpDot Grey
highlight! link javascriptGlobalStringDot Grey
highlight! link javascriptGlobalSymbolDot Grey
highlight! link javascriptGlobalURLDot Grey
highlight! link javascriptMethod GreenBold
highlight! link javascriptMethodName GreenBold
highlight! link javascriptObjectMethodName GreenBold
highlight! link javascriptGlobalMethod GreenBold
highlight! link javascriptDOMStorageMethod GreenBold
highlight! link javascriptFileMethod GreenBold
highlight! link javascriptFileReaderMethod GreenBold
highlight! link javascriptFileListMethod GreenBold
highlight! link javascriptBlobMethod GreenBold
highlight! link javascriptURLStaticMethod GreenBold
highlight! link javascriptNumberStaticMethod GreenBold
highlight! link javascriptNumberMethod GreenBold
highlight! link javascriptDOMNodeMethod GreenBold
highlight! link javascriptES6BigIntStaticMethod GreenBold
highlight! link javascriptBOMWindowMethod GreenBold
highlight! link javascriptHeadersMethod GreenBold
highlight! link javascriptRequestMethod GreenBold
highlight! link javascriptResponseMethod GreenBold
highlight! link javascriptES6SetMethod GreenBold
highlight! link javascriptReflectMethod GreenBold
highlight! link javascriptPaymentMethod GreenBold
highlight! link javascriptPaymentResponseMethod GreenBold
highlight! link javascriptTypedArrayStaticMethod GreenBold
highlight! link javascriptGeolocationMethod GreenBold
highlight! link javascriptES6MapMethod GreenBold
highlight! link javascriptServiceWorkerMethod GreenBold
highlight! link javascriptCacheMethod GreenBold
highlight! link javascriptFunctionMethod GreenBold
highlight! link javascriptXHRMethod GreenBold
highlight! link javascriptBOMNavigatorMethod GreenBold
highlight! link javascriptServiceWorkerMethod GreenBold
highlight! link javascriptDOMEventTargetMethod GreenBold
highlight! link javascriptDOMEventMethod GreenBold
highlight! link javascriptIntlMethod GreenBold
highlight! link javascriptDOMDocMethod GreenBold
highlight! link javascriptStringStaticMethod GreenBold
highlight! link javascriptStringMethod GreenBold
highlight! link javascriptSymbolStaticMethod GreenBold
highlight! link javascriptRegExpMethod GreenBold
highlight! link javascriptObjectStaticMethod GreenBold
highlight! link javascriptObjectMethod GreenBold
highlight! link javascriptBOMLocationMethod GreenBold
highlight! link javascriptJSONStaticMethod GreenBold
highlight! link javascriptGeneratorMethod GreenBold
highlight! link javascriptEncodingMethod GreenBold
highlight! link javascriptPromiseStaticMethod GreenBold
highlight! link javascriptPromiseMethod GreenBold
highlight! link javascriptBOMHistoryMethod GreenBold
highlight! link javascriptDOMFormMethod GreenBold
highlight! link javascriptClipboardMethod GreenBold
highlight! link javascriptTypedArrayStaticMethod GreenBold
highlight! link javascriptBroadcastMethod GreenBold
highlight! link javascriptDateStaticMethod GreenBold
highlight! link javascriptDateMethod GreenBold
highlight! link javascriptConsoleMethod GreenBold
highlight! link javascriptArrayStaticMethod GreenBold
highlight! link javascriptArrayMethod GreenBold
highlight! link javascriptMathStaticMethod GreenBold
highlight! link javascriptSubtleCryptoMethod GreenBold
highlight! link javascriptCryptoMethod GreenBold
highlight! link javascriptProp Aqua
highlight! link javascriptBOMWindowProp Aqua
highlight! link javascriptDOMStorageProp Aqua
highlight! link javascriptFileReaderProp Aqua
highlight! link javascriptURLUtilsProp Aqua
highlight! link javascriptNumberStaticProp Aqua
highlight! link javascriptDOMNodeProp Aqua
highlight! link javascriptRequestProp Aqua
highlight! link javascriptResponseProp Aqua
highlight! link javascriptES6SetProp Aqua
highlight! link javascriptPaymentProp Aqua
highlight! link javascriptPaymentResponseProp Aqua
highlight! link javascriptPaymentAddressProp Aqua
highlight! link javascriptPaymentShippingOptionProp Aqua
highlight! link javascriptTypedArrayStaticProp Aqua
highlight! link javascriptServiceWorkerProp Aqua
highlight! link javascriptES6MapProp Aqua
highlight! link javascriptRegExpStaticProp Aqua
highlight! link javascriptRegExpProp Aqua
highlight! link javascriptXHRProp Aqua
highlight! link javascriptBOMNavigatorProp GreenBold
highlight! link javascriptDOMEventProp Aqua
highlight! link javascriptBOMNetworkProp Aqua
highlight! link javascriptDOMDocProp Aqua
highlight! link javascriptSymbolStaticProp Aqua
highlight! link javascriptSymbolProp Aqua
highlight! link javascriptBOMLocationProp Aqua
highlight! link javascriptEncodingProp Aqua
highlight! link javascriptCryptoProp Aqua
highlight! link javascriptBOMHistoryProp Aqua
highlight! link javascriptDOMFormProp Aqua
highlight! link javascriptDataViewProp Aqua
highlight! link javascriptBroadcastProp Aqua
highlight! link javascriptMathStaticProp Aqua
" }}}
" vim-jsx-pretty: https://gitlab.com/maxmellon/vim-jsx-pretty {{{
highlight! link jsxTagName OrangeItalic
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Blue
highlight! link jsxAttrib Aqua
" }}}
" syn_end }}}
" syn_begin: typescript/typescriptreact {{{
" vim-typescript: https://gitlab.com/leafgarland/typescript-vim {{{
highlight! link typescriptSource PurpleItalic
highlight! link typescriptMessage Yellow
highlight! link typescriptGlobalObjects Aqua
highlight! link typescriptInterpolation Yellow
highlight! link typescriptInterpolationDelimiter Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:gitlab.com/HerringtonDarkholme/yats.vim {{{
highlight! link typescriptMethodAccessor OrangeItalic
highlight! link typescriptVariable Orange
highlight! link typescriptVariableDeclaration Blue
highlight! link typescriptTypeReference Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword RedItalic
highlight! link typescriptEnum Yellow
highlight! link typescriptIdentifierName Aqua
highlight! link typescriptProp Aqua
highlight! link typescriptCall Blue
highlight! link typescriptInterfaceName Yellow
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Aqua
highlight! link typescriptMemberOptionality Orange
highlight! link typescriptObjectLabel Aqua
highlight! link typescriptArrowFunc Purple
highlight! link typescriptAbstract Orange
highlight! link typescriptObjectColon Grey
highlight! link typescriptTypeAnnotation Grey
highlight! link typescriptAssign Orange
highlight! link typescriptBinaryOp Orange
highlight! link typescriptUnaryOp Orange
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName Yellow
highlight! link typescriptClassHeritage Yellow
highlight! link typescriptInterfaceHeritage Yellow
highlight! link typescriptIdentifier Purple
highlight! link typescriptGlobal Purple
highlight! link typescriptOperator RedItalic
highlight! link typescriptNodeGlobal PurpleItalic
highlight! link typescriptExport PurpleItalic
highlight! link typescriptDefaultParam Orange
highlight! link typescriptImport PurpleItalic
highlight! link typescriptTypeParameter Yellow
highlight! link typescriptReadonlyModifier Orange
highlight! link typescriptAccessibilityModifier Orange
highlight! link typescriptAmbientDeclaration RedItalic
highlight! link typescriptTemplateSubstitution Yellow
highlight! link typescriptTemplateSB Yellow
highlight! link typescriptExceptions RedItalic
highlight! link typescriptCastKeyword RedItalic
highlight! link typescriptOptionalMark Orange
highlight! link typescriptNull Aqua
highlight! link typescriptMappedIn RedItalic
highlight! link typescriptFuncTypeArrow Purple
highlight! link typescriptTernaryOp Orange
highlight! link typescriptParenExp Blue
highlight! link typescriptIndexExpr Blue
highlight! link typescriptDotNotation Grey
highlight! link typescriptGlobalNumberDot Grey
highlight! link typescriptGlobalStringDot Grey
highlight! link typescriptGlobalArrayDot Grey
highlight! link typescriptGlobalObjectDot Grey
highlight! link typescriptGlobalSymbolDot Grey
highlight! link typescriptGlobalMathDot Grey
highlight! link typescriptGlobalDateDot Grey
highlight! link typescriptGlobalJSONDot Grey
highlight! link typescriptGlobalRegExpDot Grey
highlight! link typescriptGlobalPromiseDot Grey
highlight! link typescriptGlobalURLDot Grey
highlight! link typescriptGlobalMethod GreenBold
highlight! link typescriptDOMStorageMethod GreenBold
highlight! link typescriptFileMethod GreenBold
highlight! link typescriptFileReaderMethod GreenBold
highlight! link typescriptFileListMethod GreenBold
highlight! link typescriptBlobMethod GreenBold
highlight! link typescriptURLStaticMethod GreenBold
highlight! link typescriptNumberStaticMethod GreenBold
highlight! link typescriptNumberMethod GreenBold
highlight! link typescriptDOMNodeMethod GreenBold
highlight! link typescriptPaymentMethod GreenBold
highlight! link typescriptPaymentResponseMethod GreenBold
highlight! link typescriptHeadersMethod GreenBold
highlight! link typescriptRequestMethod GreenBold
highlight! link typescriptResponseMethod GreenBold
highlight! link typescriptES6SetMethod GreenBold
highlight! link typescriptReflectMethod GreenBold
highlight! link typescriptBOMWindowMethod GreenBold
highlight! link typescriptGeolocationMethod GreenBold
highlight! link typescriptServiceWorkerMethod GreenBold
highlight! link typescriptCacheMethod GreenBold
highlight! link typescriptES6MapMethod GreenBold
highlight! link typescriptFunctionMethod GreenBold
highlight! link typescriptRegExpMethod GreenBold
highlight! link typescriptXHRMethod GreenBold
highlight! link typescriptBOMNavigatorMethod GreenBold
highlight! link typescriptServiceWorkerMethod GreenBold
highlight! link typescriptIntlMethod GreenBold
highlight! link typescriptDOMEventTargetMethod GreenBold
highlight! link typescriptDOMEventMethod GreenBold
highlight! link typescriptDOMDocMethod GreenBold
highlight! link typescriptStringStaticMethod GreenBold
highlight! link typescriptStringMethod GreenBold
highlight! link typescriptSymbolStaticMethod GreenBold
highlight! link typescriptObjectStaticMethod GreenBold
highlight! link typescriptObjectMethod GreenBold
highlight! link typescriptJSONStaticMethod GreenBold
highlight! link typescriptEncodingMethod GreenBold
highlight! link typescriptBOMLocationMethod GreenBold
highlight! link typescriptPromiseStaticMethod GreenBold
highlight! link typescriptPromiseMethod GreenBold
highlight! link typescriptSubtleCryptoMethod GreenBold
highlight! link typescriptCryptoMethod GreenBold
highlight! link typescriptBOMHistoryMethod GreenBold
highlight! link typescriptDOMFormMethod GreenBold
highlight! link typescriptConsoleMethod GreenBold
highlight! link typescriptDateStaticMethod GreenBold
highlight! link typescriptDateMethod GreenBold
highlight! link typescriptArrayStaticMethod GreenBold
highlight! link typescriptArrayMethod GreenBold
highlight! link typescriptMathStaticMethod GreenBold
highlight! link typescriptStringProperty Aqua
highlight! link typescriptDOMStorageProp Aqua
highlight! link typescriptFileReaderProp Aqua
highlight! link typescriptURLUtilsProp Aqua
highlight! link typescriptNumberStaticProp Aqua
highlight! link typescriptDOMNodeProp Aqua
highlight! link typescriptBOMWindowProp Aqua
highlight! link typescriptRequestProp Aqua
highlight! link typescriptResponseProp Aqua
highlight! link typescriptPaymentProp Aqua
highlight! link typescriptPaymentResponseProp Aqua
highlight! link typescriptPaymentAddressProp Aqua
highlight! link typescriptPaymentShippingOptionProp Aqua
highlight! link typescriptES6SetProp Aqua
highlight! link typescriptServiceWorkerProp Aqua
highlight! link typescriptES6MapProp Aqua
highlight! link typescriptRegExpStaticProp Aqua
highlight! link typescriptRegExpProp Aqua
highlight! link typescriptBOMNavigatorProp GreenBold
highlight! link typescriptXHRProp Aqua
highlight! link typescriptDOMEventProp Aqua
highlight! link typescriptDOMDocProp Aqua
highlight! link typescriptBOMNetworkProp Aqua
highlight! link typescriptSymbolStaticProp Aqua
highlight! link typescriptEncodingProp Aqua
highlight! link typescriptBOMLocationProp Aqua
highlight! link typescriptCryptoProp Aqua
highlight! link typescriptDOMFormProp Aqua
highlight! link typescriptBOMHistoryProp Aqua
highlight! link typescriptMathStaticProp Aqua
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link tsxTSConstructor TSType
if has('nvim-0.8')
  highlight! link @constructor.tsx tsxTSConstructor
  highlight! link @punctuation.special.typescript TSOperator
  highlight! link @punctuation.special.tsx TSOperator
endif
if has('nvim-0.9')
  highlight! link @lsp.typemod.variable.defaultLibrary.typescript TSConstBuiltin
  highlight! link @lsp.typemod.variable.defaultLibrary.typescriptreact TSConstBuiltin
endif
" }}}
" syn_end }}}
" syn_begin: dart {{{
" dart-lang: https://gitlab.com/dart-lang/dart-vim-plugin {{{
highlight! link dartCoreClasses Aqua
highlight! link dartTypeName Aqua
highlight! link dartInterpolation Blue
highlight! link dartTypeDef RedItalic
highlight! link dartClassDecl RedItalic
highlight! link dartLibrary PurpleItalic
highlight! link dartMetadata Blue
" }}}
" syn_end }}}
" syn_begin: coffee {{{
" vim-coffee-script: https://gitlab.com/kchmck/vim-coffee-script {{{
highlight! link coffeeExtendedOp Orange
highlight! link coffeeSpecialOp Fg
highlight! link coffeeDotAccess Grey
highlight! link coffeeCurly Fg
highlight! link coffeeParen Fg
highlight! link coffeeBracket Fg
highlight! link coffeeParens Blue
highlight! link coffeeBrackets Blue
highlight! link coffeeCurlies Blue
highlight! link coffeeOperator RedItalic
highlight! link coffeeStatement Orange
highlight! link coffeeSpecialIdent Purple
highlight! link coffeeObject Purple
highlight! link coffeeObjAssign Aqua
" }}}
" syn_end }}}
" syn_begin: purescript {{{
" purescript-vim: https://gitlab.com/purescript-contrib/purescript-vim {{{
highlight! link purescriptModuleKeyword PurpleItalic
highlight! link purescriptModule Aqua
highlight! link purescriptModuleParams Blue
highlight! link purescriptAsKeyword OrangeItalic
highlight! link purescriptHidingKeyword OrangeItalic
highlight! link purescriptWhere OrangeItalic
highlight! link purescriptIdentifier Blue
highlight! link purescriptFunction Yellow
highlight! link purescriptType Aqua
" }}}
" syn_end }}}
" syn_begin: c/cpp/objc/objcpp {{{
" vim-cpp-enhanced-highlight: https://gitlab.com/octol/vim-cpp-enhanced-highlight {{{
highlight! link cppSTLnamespace Purple
highlight! link cppSTLtype Yellow
highlight! link cppAccess PurpleItalic
highlight! link cppStructure RedItalic
highlight! link cppSTLios Aqua
highlight! link cppSTLiterator PurpleItalic
highlight! link cppSTLexception Purple
" }}}
" vim-cpp-modern: https://gitlab.com/bfrg/vim-cpp-modern {{{
highlight! link cppSTLVariable Aqua
" }}}
" chromatica: https://gitlab.com/arakashic/chromatica.nvim {{{
highlight! link Member TSVariable
highlight! link Variable TSVariable
highlight! link Namespace TSNamespace
highlight! link EnumConstant TSNumber
highlight! link chromaticaException TSException
highlight! link chromaticaCast TSLabel
highlight! link OperatorOverload TSOperator
highlight! link AccessQual TSOperator
highlight! link Linkage TSOperator
highlight! link AutoType TSType
" }}}
" vim-lsp-cxx-highlight https://gitlab.com/jackguo380/vim-lsp-cxx-highlight {{{
highlight! link LspCxxHlSkippedRegion Grey
highlight! link LspCxxHlSkippedRegionBeginEnd TSKeyword
highlight! link LspCxxHlGroupEnumConstant BlueItalic
highlight! link LspCxxHlGroupNamespace TSNamespace
highlight! link LspCxxHlGroupMemberVariable TSVariable
" }}}
" syn_end }}}
" syn_begin: objc {{{
" builtin: {{{
highlight! link objcModuleImport PurpleItalic
highlight! link objcException RedItalic
highlight! link objcProtocolList Aqua
highlight! link objcObjDef PurpleItalic
highlight! link objcDirective RedItalic
highlight! link objcPropertyAttribute Orange
highlight! link objcHiddenArgument Aqua
" }}}
" syn_end }}}
" syn_begin: cs {{{
" builtin: https://gitlab.com/nickspoons/vim-cs {{{
highlight! link csUnspecifiedStatement PurpleItalic
highlight! link csStorage RedItalic
highlight! link csClass RedItalic
highlight! link csNewType Aqua
highlight! link csContextualStatement PurpleItalic
highlight! link csInterpolationDelimiter Yellow
highlight! link csInterpolation Yellow
highlight! link csEndColon Fg
" }}}
" syn_end }}}
" syn_begin: python {{{
" builtin: {{{
highlight! link pythonBuiltin Yellow
highlight! link pythonExceptions Purple
highlight! link pythonDecoratorName Blue
" }}}
" python-syntax: https://gitlab.com/vim-python/python-syntax {{{
highlight! link pythonExClass Purple
highlight! link pythonBuiltinType Yellow
highlight! link pythonBuiltinObj Blue
highlight! link pythonDottedName PurpleItalic
highlight! link pythonBuiltinFunc GreenBold
highlight! link pythonFunction AquaBold
highlight! link pythonDecorator Orange
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonRun Blue
highlight! link pythonCoding Grey
highlight! link pythonOperator Orange
highlight! link pythonConditional RedItalic
highlight! link pythonRepeat RedItalic
highlight! link pythonException RedItalic
highlight! link pythonNone Aqua
highlight! link pythonDot Grey
" }}}
" semshi: https://gitlab.com/numirias/semshi {{{
call catppuccin_frappe_redux#highlight('semshiUnresolved', s:palette.yellow, s:palette.none, 'undercurl')
highlight! link semshiImported TSInclude
highlight! link semshiParameter TSParameter
highlight! link semshiParameterUnused Grey
highlight! link semshiSelf TSVariableBuiltin
highlight! link semshiGlobal TSType
highlight! link semshiBuiltin TSTypeBuiltin
highlight! link semshiAttribute TSAttribute
highlight! link semshiLocal TSKeyword
highlight! link semshiFree TSKeyword
highlight! link semshiSelected CurrentWord
highlight! link semshiErrorSign RedSign
highlight! link semshiErrorChar RedSign
" }}}
" syn_end }}}
" syn_begin: lua {{{
" builtin: {{{
highlight! link luaFunc GreenBold
highlight! link luaFunction Aqua
highlight! link luaTable Fg
highlight! link luaIn RedItalic
" }}}
" vim-lua: https://gitlab.com/tbastos/vim-lua {{{
highlight! link luaFuncCall GreenBold
highlight! link luaLocal Orange
highlight! link luaSpecialValue GreenBold
highlight! link luaBraces Fg
highlight! link luaBuiltIn Purple
highlight! link luaNoise Grey
highlight! link luaLabel Purple
highlight! link luaFuncTable Yellow
highlight! link luaFuncArgName Blue
highlight! link luaEllipsis Orange
highlight! link luaDocTag Green
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link luaTSConstructor luaBraces
if has('nvim-0.8')
  highlight! link @constructor.lua luaTSConstructor
endif
" }}}
" syn_end }}}
" syn_begin: moon {{{
" moonscript-vim: https://gitlab.com/leafo/moonscript-vim {{{
highlight! link moonInterpDelim Yellow
highlight! link moonInterp Blue
highlight! link moonFunction Green
highlight! link moonLuaFunc AquaBold
highlight! link moonSpecialVar Purple
highlight! link moonObject Yellow
highlight! link moonDotAccess Grey
" }}}
" syn_end }}}
" syn_begin: java {{{
" builtin: {{{
highlight! link javaClassDecl RedItalic
highlight! link javaMethodDecl RedItalic
highlight! link javaVarArg Green
highlight! link javaAnnotation Blue
highlight! link javaUserLabel Purple
highlight! link javaTypedef Aqua
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" syn_end }}}
" syn_begin: kotlin {{{
" kotlin-vim: https://gitlab.com/udalov/kotlin-vim {{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure RedItalic
highlight! link ktKeyword Aqua
" }}}
" syn_end }}}
" syn_begin: scala {{{
" builtin: https://gitlab.com/derekwyatt/vim-scala {{{
highlight! link scalaNameDefinition Aqua
highlight! link scalaInterpolationBoundary Yellow
highlight! link scalaInterpolation Blue
highlight! link scalaTypeOperator Orange
highlight! link scalaOperator Orange
highlight! link scalaKeywordModifier Orange
" }}}
" syn_end }}}
" syn_begin: go {{{
" builtin: https://gitlab.com/fatih/vim-go {{{
highlight! link goPackage Define
highlight! link goImport Include
highlight! link goVar OrangeItalic
highlight! link goConst goVar
highlight! link goType Yellow
highlight! link goSignedInts goType
highlight! link goUnsignedInts goType
highlight! link goFloats goType
highlight! link goComplexes goType
highlight! link goVarDefs Aqua
highlight! link goDeclType OrangeItalic
highlight! link goFunctionCall Function
highlight! link goPredefinedIdentifiers Aqua
highlight! link goBuiltins GreenBold
highlight! link goVarArgs Grey
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link goTSInclude Purple
highlight! link goTSNamespace Fg
highlight! link goTSConstBuiltin AquaItalic
if has('nvim-0.8')
  highlight! link @include.go goTSInclude
  highlight! link @namespace.go goTSNamespace
  highlight! link @module.go goTSNamespace
  highlight! link @constant.builtin.go goTSConstBuiltin
endif
if has('nvim-0.9')
  highlight! link @lsp.typemod.variable.defaultLibrary.go goTSConstBuiltin
  highlight! link @lsp.type.namespace.go goTSNamespace
endif
" }}}
" syn_end }}}
" syn_begin: rust {{{
" builtin: https://gitlab.com/rust-lang/rust.vim {{{
highlight! link rustStructure Orange
highlight! link rustIdentifier Purple
highlight! link rustModPath Orange
highlight! link rustModPathSep Grey
highlight! link rustSelf Blue
highlight! link rustSuper Blue
highlight! link rustDeriveTrait PurpleItalic
highlight! link rustEnumVariant Purple
highlight! link rustMacroVariable Blue
highlight! link rustAssert Aqua
highlight! link rustPanic Aqua
highlight! link rustPubScopeCrate PurpleItalic
" }}}
" coc-rust-analyzer: https://gitlab.com/fannheyward/coc-rust-analyzer {{{
highlight! link CocRustChainingHint Grey
highlight! link CocRustTypeHint Grey
" }}}
" syn_end }}}
" syn_begin: swift {{{
" swift.vim: https://gitlab.com/keith/swift.vim {{{
highlight! link swiftInterpolatedWrapper Yellow
highlight! link swiftInterpolatedString Blue
highlight! link swiftProperty Aqua
highlight! link swiftTypeDeclaration Orange
highlight! link swiftClosureArgument Purple
" }}}
" syn_end }}}
" syn_begin: php {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD {{{
highlight! link phpVarSelector Blue
highlight! link phpDefine OrangeItalic
highlight! link phpStructure RedItalic
highlight! link phpSpecialFunction GreenBold
highlight! link phpInterpSimpleCurly Yellow
highlight! link phpComparison Orange
highlight! link phpMethodsVar Aqua
highlight! link phpMemberSelector Green
" }}}
" php.vim: https://gitlab.com/StanAngeloff/php.vim {{{
highlight! link phpParent Fg
highlight! link phpNowDoc Green
highlight! link phpFunction GreenBold
highlight! link phpMethod GreenBold
highlight! link phpClass Orange
highlight! link phpSuperglobals Purple
" }}}
" syn_end }}}
" syn_begin: ruby {{{
" builtin: https://gitlab.com/vim-ruby/vim-ruby {{{
highlight! link rubyKeywordAsMethod GreenBold
highlight! link rubyInterpolation Yellow
highlight! link rubyInterpolationDelimiter Yellow
highlight! link rubyStringDelimiter Green
highlight! link rubyBlockParameterList Blue
highlight! link rubyDefine RedItalic
highlight! link rubyModuleName Purple
highlight! link rubyAccess Orange
highlight! link rubyAttribute Yellow
highlight! link rubyMacro RedItalic
" }}}
" syn_end }}}
" syn_begin: haskell {{{
" haskell-vim: https://gitlab.com/neovimhaskell/haskell-vim {{{
highlight! link haskellBrackets Blue
highlight! link haskellIdentifier Yellow
highlight! link haskellAssocType Aqua
highlight! link haskellQuotedType Aqua
highlight! link haskellType Aqua
highlight! link haskellDeclKeyword RedItalic
highlight! link haskellWhere RedItalic
highlight! link haskellDeriving PurpleItalic
highlight! link haskellForeignKeywords PurpleItalic
" }}}
" syn_end }}}
" syn_begin: perl/pod {{{
" builtin: https://gitlab.com/vim-perl/vim-perl {{{
highlight! link perlStatementPackage PurpleItalic
highlight! link perlStatementInclude PurpleItalic
highlight! link perlStatementStorage Orange
highlight! link perlStatementList Orange
highlight! link perlMatchStartEnd Orange
highlight! link perlVarSimpleMemberName Aqua
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod GreenBold
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
" }}}
" syn_end }}}
" syn_begin: ocaml {{{
" builtin: https://gitlab.com/rgrinberg/vim-ocaml {{{
highlight! link ocamlArrow Orange
highlight! link ocamlEqual Orange
highlight! link ocamlOperator Orange
highlight! link ocamlKeyChar Orange
highlight! link ocamlModPath Green
highlight! link ocamlFullMod Green
highlight! link ocamlModule Purple
highlight! link ocamlConstructor Aqua
highlight! link ocamlFuncWith Yellow
highlight! link ocamlWith Yellow
highlight! link ocamlModParam Fg
highlight! link ocamlModParam1 Fg
highlight! link ocamlAnyVar Blue
highlight! link ocamlPpxEncl Orange
highlight! link ocamlPpxIdentifier Blue
highlight! link ocamlSigEncl Orange
highlight! link ocamlStructEncl Aqua
highlight! link ocamlModParam1 Blue
" }}}
" syn_end }}}
" syn_begin: erlang {{{
" builtin: https://gitlab.com/vim-erlang/vim-erlang-runtime {{{
highlight! link erlangAtom Aqua
highlight! link erlangLocalFuncRef GreenBold
highlight! link erlangLocalFuncCall GreenBold
highlight! link erlangGlobalFuncRef GreenBold
highlight! link erlangGlobalFuncCall GreenBold
highlight! link erlangAttribute PurpleItalic
highlight! link erlangPipe Orange
" }}}
" syn_end }}}
" syn_begin: elixir {{{
" vim-elixir: https://gitlab.com/elixir-editors/vim-elixir {{{
highlight! link elixirStringDelimiter Green
highlight! link elixirKeyword Orange
highlight! link elixirInterpolation Yellow
highlight! link elixirInterpolationDelimiter Yellow
highlight! link elixirSelf Purple
highlight! link elixirPseudoVariable Purple
highlight! link elixirModuleDefine PurpleItalic
highlight! link elixirBlockDefinition RedItalic
highlight! link elixirDefine RedItalic
highlight! link elixirPrivateDefine RedItalic
highlight! link elixirGuard RedItalic
highlight! link elixirPrivateGuard RedItalic
highlight! link elixirProtocolDefine RedItalic
highlight! link elixirImplDefine RedItalic
highlight! link elixirRecordDefine RedItalic
highlight! link elixirPrivateRecordDefine RedItalic
highlight! link elixirMacroDefine RedItalic
highlight! link elixirPrivateMacroDefine RedItalic
highlight! link elixirDelegateDefine RedItalic
highlight! link elixirOverridableDefine RedItalic
highlight! link elixirExceptionDefine RedItalic
highlight! link elixirCallbackDefine RedItalic
highlight! link elixirStructDefine RedItalic
highlight! link elixirExUnitMacro RedItalic
" }}}
" syn_end }}}
" syn_begin: lisp {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP {{{
highlight! link lispAtomMark Green
highlight! link lispKey Aqua
highlight! link lispFunc OrangeItalic
" }}}
" syn_end }}}
" syn_begin: clojure {{{
" builtin: https://gitlab.com/guns/vim-clojure-static {{{
highlight! link clojureMacro PurpleItalic
highlight! link clojureFunc AquaBold
highlight! link clojureConstant Yellow
highlight! link clojureSpecial RedItalic
highlight! link clojureDefine RedItalic
highlight! link clojureKeyword Orange
highlight! link clojureVariable Blue
highlight! link clojureMeta Yellow
highlight! link clojureDeref Yellow
" }}}
" syn_end }}}
" syn_begin: matlab {{{
" builtin: {{{
highlight! link matlabSemicolon Fg
highlight! link matlabFunction RedItalic
highlight! link matlabImplicit GreenBold
highlight! link matlabDelimiter Fg
highlight! link matlabOperator GreenBold
highlight! link matlabArithmeticOperator Orange
highlight! link matlabArithmeticOperator Orange
highlight! link matlabRelationalOperator Orange
highlight! link matlabRelationalOperator Orange
highlight! link matlabLogicalOperator Orange
" }}}
" syn_end }}}
" syn_begin: octave {{{
" vim-octave: https://gitlab.com/McSinyx/vim-octave{{{
highlight! link octaveDelimiter Fg
highlight! link octaveSemicolon Grey
highlight! link octaveOperator Orange
highlight! link octaveVariable YellowItalic
highlight! link octaveVarKeyword YellowItalic
" }}}
" syn_end }}}
" syn_begin: sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH {{{
highlight! link shRange Fg
highlight! link shTestOpr Orange
highlight! link shOption Aqua
highlight! link bashStatement Orange
highlight! link shOperator Orange
highlight! link shQuote Green
highlight! link shSet Orange
highlight! link shSetList Blue
highlight! link shSnglCase Orange
highlight! link shVariable Blue
highlight! link shVarAssign Orange
highlight! link shCmdSubRegion Green
highlight! link shCommandSub Orange
highlight! link shFunctionOne GreenBold
highlight! link shFunctionKey RedItalic
" }}}
" syn_end }}}
" syn_begin: zsh {{{
" builtin: https://gitlab.com/chrisbra/vim-zsh {{{
highlight! link zshOptStart PurpleItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction GreenBold
highlight! link zshDeref Blue
highlight! link zshTypes Orange
highlight! link zshVariableDef Blue
" }}}
" syn_end }}}
" syn_begin: fish {{{
" vim-fish: https://gitlab.com/georgewitteman/vim-fish {{{
highlight! link fishStatement Orange
highlight! link fishLabel RedItalic
highlight! link fishCommandSub Yellow
" }}}
" syn_end }}}
" syn_begin: ps1 {{{
" vim-ps1: https://gitlab.com/PProvost/vim-ps1 {{{
highlight! link ps1FunctionInvocation AquaBold
highlight! link ps1FunctionDeclaration AquaBold
highlight! link ps1InterpolationDelimiter Yellow
highlight! link ps1BuiltIn Yellow
" }}}
" syn_end }}}
" syn_begin: vim {{{
call catppuccin_frappe_redux#highlight('vimCommentTitle', s:palette.grey1, s:palette.none, 'bold')
highlight! link vimLet Orange
highlight! link vimFunction GreenBold
highlight! link vimIsCommand Fg
highlight! link vimUserFunc GreenBold
highlight! link vimFuncName GreenBold
highlight! link vimMap PurpleItalic
highlight! link vimNotation Aqua
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimSetEqual Yellow
highlight! link vimSetSep Fg
highlight! link vimOption Aqua
highlight! link vimUserAttrbKey Yellow
highlight! link vimUserAttrb Green
highlight! link vimAutoCmdSfxList Aqua
highlight! link vimSynType Orange
highlight! link vimHiBang Orange
highlight! link vimSet Yellow
highlight! link vimSetSep Grey
highlight! link vimContinue Grey
" syn_end }}}
" syn_begin: make {{{
highlight! link makeIdent Aqua
highlight! link makeSpecTarget Yellow
highlight! link makeTarget Blue
highlight! link makeCommands Orange
" syn_end }}}
" syn_begin: cmake {{{
highlight! link cmakeCommand Orange
highlight! link cmakeKWconfigure_package_config_file Yellow
highlight! link cmakeKWwrite_basic_package_version_file Yellow
highlight! link cmakeKWExternalProject Aqua
highlight! link cmakeKWadd_compile_definitions Aqua
highlight! link cmakeKWadd_compile_options Aqua
highlight! link cmakeKWadd_custom_command Aqua
highlight! link cmakeKWadd_custom_target Aqua
highlight! link cmakeKWadd_definitions Aqua
highlight! link cmakeKWadd_dependencies Aqua
highlight! link cmakeKWadd_executable Aqua
highlight! link cmakeKWadd_library Aqua
highlight! link cmakeKWadd_link_options Aqua
highlight! link cmakeKWadd_subdirectory Aqua
highlight! link cmakeKWadd_test Aqua
highlight! link cmakeKWbuild_command Aqua
highlight! link cmakeKWcmake_host_system_information Aqua
highlight! link cmakeKWcmake_minimum_required Aqua
highlight! link cmakeKWcmake_parse_arguments Aqua
highlight! link cmakeKWcmake_policy Aqua
highlight! link cmakeKWconfigure_file Aqua
highlight! link cmakeKWcreate_test_sourcelist Aqua
highlight! link cmakeKWctest_build Aqua
highlight! link cmakeKWctest_configure Aqua
highlight! link cmakeKWctest_coverage Aqua
highlight! link cmakeKWctest_memcheck Aqua
highlight! link cmakeKWctest_run_script Aqua
highlight! link cmakeKWctest_start Aqua
highlight! link cmakeKWctest_submit Aqua
highlight! link cmakeKWctest_test Aqua
highlight! link cmakeKWctest_update Aqua
highlight! link cmakeKWctest_upload Aqua
highlight! link cmakeKWdefine_property Aqua
highlight! link cmakeKWdoxygen_add_docs Aqua
highlight! link cmakeKWenable_language Aqua
highlight! link cmakeKWenable_testing Aqua
highlight! link cmakeKWexec_program Aqua
highlight! link cmakeKWexecute_process Aqua
highlight! link cmakeKWexport Aqua
highlight! link cmakeKWexport_library_dependencies Aqua
highlight! link cmakeKWfile Aqua
highlight! link cmakeKWfind_file Aqua
highlight! link cmakeKWfind_library Aqua
highlight! link cmakeKWfind_package Aqua
highlight! link cmakeKWfind_path Aqua
highlight! link cmakeKWfind_program Aqua
highlight! link cmakeKWfltk_wrap_ui Aqua
highlight! link cmakeKWforeach Aqua
highlight! link cmakeKWfunction Aqua
highlight! link cmakeKWget_cmake_property Aqua
highlight! link cmakeKWget_directory_property Aqua
highlight! link cmakeKWget_filename_component Aqua
highlight! link cmakeKWget_property Aqua
highlight! link cmakeKWget_source_file_property Aqua
highlight! link cmakeKWget_target_property Aqua
highlight! link cmakeKWget_test_property Aqua
highlight! link cmakeKWif Aqua
highlight! link cmakeKWinclude Aqua
highlight! link cmakeKWinclude_directories Aqua
highlight! link cmakeKWinclude_external_msproject Aqua
highlight! link cmakeKWinclude_guard Aqua
highlight! link cmakeKWinstall Aqua
highlight! link cmakeKWinstall_files Aqua
highlight! link cmakeKWinstall_programs Aqua
highlight! link cmakeKWinstall_targets Aqua
highlight! link cmakeKWlink_directories Aqua
highlight! link cmakeKWlist Aqua
highlight! link cmakeKWload_cache Aqua
highlight! link cmakeKWload_command Aqua
highlight! link cmakeKWmacro Aqua
highlight! link cmakeKWmark_as_advanced Aqua
highlight! link cmakeKWmath Aqua
highlight! link cmakeKWmessage Aqua
highlight! link cmakeKWoption Aqua
highlight! link cmakeKWproject Aqua
highlight! link cmakeKWqt_wrap_cpp Aqua
highlight! link cmakeKWqt_wrap_ui Aqua
highlight! link cmakeKWremove Aqua
highlight! link cmakeKWseparate_arguments Aqua
highlight! link cmakeKWset Aqua
highlight! link cmakeKWset_directory_properties Aqua
highlight! link cmakeKWset_property Aqua
highlight! link cmakeKWset_source_files_properties Aqua
highlight! link cmakeKWset_target_properties Aqua
highlight! link cmakeKWset_tests_properties Aqua
highlight! link cmakeKWsource_group Aqua
highlight! link cmakeKWstring Aqua
highlight! link cmakeKWsubdirs Aqua
highlight! link cmakeKWtarget_compile_definitions Aqua
highlight! link cmakeKWtarget_compile_features Aqua
highlight! link cmakeKWtarget_compile_options Aqua
highlight! link cmakeKWtarget_include_directories Aqua
highlight! link cmakeKWtarget_link_directories Aqua
highlight! link cmakeKWtarget_link_libraries Aqua
highlight! link cmakeKWtarget_link_options Aqua
highlight! link cmakeKWtarget_precompile_headers Aqua
highlight! link cmakeKWtarget_sources Aqua
highlight! link cmakeKWtry_compile Aqua
highlight! link cmakeKWtry_run Aqua
highlight! link cmakeKWunset Aqua
highlight! link cmakeKWuse_mangled_mesa Aqua
highlight! link cmakeKWvariable_requires Aqua
highlight! link cmakeKWvariable_watch Aqua
highlight! link cmakeKWwrite_file Aqua
" syn_end }}}
" syn_begin: json {{{
highlight! link jsonKeyword Orange
highlight! link jsonQuote Grey
highlight! link jsonBraces Fg
" syn_end }}}
" syn_begin: yaml {{{
highlight! link yamlKey Orange
highlight! link yamlConstant Purple
" syn_end }}}
" syn_begin: toml {{{
call catppuccin_frappe_redux#highlight('tomlTable', s:palette.purple, s:palette.none, 'bold')
highlight! link tomlKey Orange
highlight! link tomlBoolean Aqua
highlight! link tomlTableArray tomlTable
" syn_end }}}
" syn_begin: gitcommit {{{
" builtin {{{
highlight! link gitcommitSummary Red
highlight! link gitcommitUntracked Grey
highlight! link gitcommitDiscarded Grey
highlight! link gitcommitSelected Grey
highlight! link gitcommitUnmerged Grey
highlight! link gitcommitOnBranch Grey
highlight! link gitcommitArrow Grey
highlight! link gitcommitFile Green
" }}}
" nvim-treesitter/nvim-treesitter {{{
if has('nvim-0.8')
  highlight! link @text.gitcommit TSNone
endif
" }}}
" syn_end }}}
" syn_begin: dosini {{{
call catppuccin_frappe_redux#highlight('dosiniHeader', s:palette.red, s:palette.none, 'bold')
highlight! link dosiniLabel Yellow
highlight! link dosiniValue Green
highlight! link dosiniNumber Green
" syn_end }}}
" syn_begin: help {{{
call catppuccin_frappe_redux#highlight('helpNote', s:palette.purple, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('helpHeadline', s:palette.red, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('helpHeader', s:palette.orange, s:palette.none, 'bold')
call catppuccin_frappe_redux#highlight('helpURL', s:palette.green, s:palette.none, 'underline')
call catppuccin_frappe_redux#highlight('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
highlight! link helpHyperTextJump Yellow
highlight! link helpCommand Aqua
highlight! link helpExample Green
highlight! link helpSpecial Blue
highlight! link helpSectionDelim Grey
" syn_end }}}
" syn_begin: neotest-summary {{{
" https://gitlab.com/nvim-neotest/neotest
if has('nvim')
highlight! link NeotestNamespace Purple
highlight! link NeotestFile Blue
highlight! link NeotestDir Directory
highlight! link NeotestIndent NonText
call catppuccin_frappe_redux#highlight('NeotestExpandMarker', s:palette.bg5, s:palette.none)
highlight! link NeotestAdapterName Red
highlight! link NeotestMarked Orange
highlight! link NeotestTarget Red
endif
" syn_end }}}
" syn_begin: mason {{{
" https://gitlab.com/williamboman/mason.nvim
call catppuccin_frappe_redux#highlight('MasonHeader', s:palette.bg0, s:palette.red, 'bold')
call catppuccin_frappe_redux#highlight('MasonHeaderSecondary', s:palette.bg0, s:palette.orange, 'bold')
highlight! link MasonHighlight Green
highlight! link MasonHighlightSecondary Yellow
call catppuccin_frappe_redux#highlight('MasonHighlightBlock', s:palette.bg0, s:palette.orange)
call catppuccin_frappe_redux#highlight('MasonHighlightBlockBold', s:palette.bg0, s:palette.orange, 'bold')
call catppuccin_frappe_redux#highlight('MasonHighlightBlockSecondary', s:palette.bg0, s:palette.red)
call catppuccin_frappe_redux#highlight('MasonHighlightBlockBoldSecondary', s:palette.bg0, s:palette.red, 'bold')
call catppuccin_frappe_redux#highlight('MasonMuted', s:palette.grey0, s:palette.none)
call catppuccin_frappe_redux#highlight('MasonMutedBlock', s:palette.bg0, s:palette.grey0)
" syn_end }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
