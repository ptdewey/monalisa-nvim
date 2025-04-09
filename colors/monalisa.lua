local colors = {
    -- content here will not be touched
    -- PATCH_OPEN
Normal = {fg = "#ffe598", bg = "#120b0d"},
Delimiter = {link = "Normal"},
SignColumn = {link = "Normal"},
["@punctuation.bracket"] = {link = "Normal"},
["@boolean"] = {link = "Boolean"},
["@character"] = {link = "Character"},
Comment = {fg = "#514743"},
Ignore = {link = "Comment"},
["@comment"] = {link = "Comment"},
["@text.literal"] = {link = "Comment"},
Conceal = {},
["@conditional"] = {link = "Conditional"},
Constant = {fg = "#9e333f"},
Boolean = {link = "Constant"},
Character = {link = "Constant"},
["@constant"] = {link = "Constant"},
["@constant.builtin"] = {link = "Constant"},
CurSearch = {fg = "#120b0d", bg = "#598058"},
Cursor = {fg = "#120b0d", bg = "#ffe598"},
TermCursor = {link = "Cursor"},
CursorLine = {},
CursorLineFold = {},
CursorLineNr = {},
CursorLineSign = {},
Debug = {},
["@debug"] = {link = "Debug"},
Define = {},
["@constant.macro"] = {link = "Define"},
["@define"] = {link = "Define"},
DiagnosticError = {fg = "#992a21"},
DiagnosticFloatingError = {link = "DiagnosticError"},
DiagnosticSignError = {link = "DiagnosticError"},
DiagnosticVirtualTextError = {link = "DiagnosticError"},
DiagnosticHint = {fg = "#514743"},
DiagnosticFloatingHint = {link = "DiagnosticHint"},
DiagnosticSignHint = {link = "DiagnosticHint"},
DiagnosticVirtualTextHint = {link = "DiagnosticHint"},
DiagnosticInfo = {fg = "#6a5f3f"},
DiagnosticFloatingInfo = {link = "DiagnosticInfo"},
DiagnosticSignInfo = {link = "DiagnosticInfo"},
DiagnosticVirtualTextInfo = {link = "DiagnosticInfo"},
DiagnosticOk = {fg = "#928f4e"},
DiagnosticFloatingOk = {link = "DiagnosticOk"},
DiagnosticSignOk = {link = "DiagnosticOk"},
DiagnosticVirtualTextOk = {link = "DiagnosticOk"},
DiagnosticUnderlineError = {},
DiagnosticUnderlineHint = {},
DiagnosticUnderlineInfo = {},
DiagnosticUnderlineOk = {},
DiagnosticUnderlineWarn = {},
DiagnosticWarn = {fg = "#c16e31"},
DiagnosticFloatingWarn = {link = "DiagnosticWarn"},
DiagnosticSignWarn = {link = "DiagnosticWarn"},
DiagnosticVirtualTextWarn = {link = "DiagnosticWarn"},
DiffAdd = {fg = "#636135"},
DiffChange = {fg = "#514743"},
DiffDelete = {fg = "#992a21"},
DiffText = {},
Directory = {},
EndOfBuffer = {},
Error = {fg = "#992a21"},
ErrorMsg = {fg = "#c16e31"},
["@exception"] = {link = "Exception"},
Field = {fg = "#928f4e"},
["@field"] = {link = "Field"},
["@property"] = {link = "Field"},
["@float"] = {link = "Float"},
FloatBorder = {},
FloatTitle = {},
Function = {fg = "#9a5727"},
["@function"] = {link = "Function"},
["@method"] = {link = "Function"},
IblIndent = {fg = "#252F1E", nocombine = true},
IblScope = {fg = "#444A2B", nocombine = true},
IblWhitespace = {fg = "#252F1E", nocombine = true},
Identifier = {fg = "#ffe598"},
["@namespace"] = {link = "Identifier"},
["@parameter"] = {link = "Identifier"},
["@text.reference"] = {link = "Identifier"},
["@variable"] = {link = "Identifier"},
IncSearch = {fg = "#120b0d", bg = "#598058"},
Include = {},
["@include"] = {link = "Include"},
Keyword = {fg = "#636135"},
Statement = {link = "Keyword"},
["@keyword"] = {link = "Keyword"},
["@label"] = {link = "Label"},
LineNr = {fg = "#636135"},
LineNrAbove = {fg = "#514743"},
LineNrBelow = {fg = "#514743"},
LspCodeLens = {},
LspCodeLensSeparator = {},
LspReferenceRead = {},
LspReferenceText = {},
LspReferenceWrite = {},
LspSignatureActiveParameter = {},
Macro = {},
["@function.macro"] = {link = "Macro"},
["@macro"] = {link = "Macro"},
MatchParen = {},
ModeMsg = {},
MoreMsg = {},
MsgArea = {},
MsgSeparator = {},
NonText = {},
NormalFloat = {},
NormalNC = {},
Number = {fg = "#992a21"},
Float = {link = "Number"},
["@number"] = {link = "Number"},
Operator = {fg = "#525c5d"},
["@operator"] = {link = "Operator"},
Pmenu = {},
PmenuExtra = {},
PmenuExtraSel = {},
PmenuKind = {},
PmenuKindSel = {},
PmenuSbar = {},
PmenuSel = {},
PmenuThumb = {},
PreCondit = {},
PreProc = {},
["@preproc"] = {link = "PreProc"},
Question = {},
QuickFixLine = {},
["@repeat"] = {link = "Repeat"},
Search = {fg = "#120b0d", bg = "#c16e31"},
Special = {fg = "#c16e31"},
SpecialChar = {link = "Special"},
["@constructor"] = {link = "Special"},
["@function.builtin"] = {link = "Special"},
["@string.escape"] = {link = "SpecialChar"},
["@string.special"] = {link = "SpecialChar"},
SpecialComment = {},
["@character.special"] = {link = "SpecialComment"},
SpecialKey = {},
SpellBad = {},
SpellCap = {},
SpellLocal = {},
SpellRare = {},
Conditional = {link = "Statement"},
Exception = {link = "Statement"},
Label = {link = "Statement"},
Repeat = {link = "Statement"},
StatusLine = {},
StatusLineNC = {},
["@storageclass"] = {link = "StorageClass"},
String = {fg = "#bb8a3e"},
["@string"] = {link = "String"},
Substitute = {},
TabLine = {},
TabLineFill = {},
TabLineSel = {},
Tag = {},
["@tag"] = {link = "Tag"},
Title = {},
["@text.title"] = {link = "Title"},
Todo = {fg = "#f6d666"},
["@text.todo"] = {link = "Todo"},
Type = {fg = "#874228"},
StorageClass = {link = "Type"},
Typedef = {link = "Type"},
["@structure"] = {link = "Type"},
["@type"] = {link = "Type"},
["@type.definition"] = {link = "Typedef"},
Underlined = {underline = true},
["@text.underline"] = {link = "Underlined"},
["@text.uri"] = {link = "Underlined"},
Visual = {bg = "#231a1d"},
VisualNOS = {},
WarningMsg = {},
Whitespace = {},
WildMenu = {},
WinBar = {},
WinBarNC = {},
Winseparator = {},
["@punctuation"] = {fg = "#6a5f3f"},
    -- PATCH_CLOSE
    -- content here will not be touched
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='monalisa'")

-- apply highlight groups
for group, attrs in pairs(colors) do
    vim.api.nvim_set_hl(0, group, attrs)
end
