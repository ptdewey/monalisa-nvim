local lush = require("lush")
-- local c = require("palette")
local hsl = lush.hsl

---@class monalisa.colors
---@field black string
---@field brown string
---@field red string
---@field green string
---@field orange string
---@field blue string
---@field crimson string
---@field teal string
---@field yellow string

---@type monalisa.colors
local theme = {
    black = "#120b0d",
    brown = "#341b0f",
    red = "#992a21",
    green = "#636135",
    orange = "#c16e31",
    blue = "#525c5d",
    crimson = "#991f2d",
    teal = "#598058",
    yellow = "#f6d666",

    tan = "#ffe598",
    brightGreen = "#b4b264",
    brightBlack = "#874228",
    darkYellow = "#bb8a3e",

    fg = "#f7e7ae", -- Not being used?

    comment = "#514743",
    punc = "#6a5f3f",
    selection = "#231a1d",
}

local c = {
    bg = theme.black,
    fg = theme.tan,
    keyword = theme.green,
    type = theme.brightGreen,
    func = theme.orange,
    operator = theme.blue,
    number = theme.red,
    -- special = hsl(theme.orange).darken(),
    special = theme.orange,
    field = theme.teal,
    -- field = hsl(theme.brown).lighten(25),
    string = theme.darkYellow,
    error = theme.red,
    warn = theme.orange,
    info = theme.punc,
    hint = theme.comment,
    ok = theme.brightGreen,
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        Normal({ fg = c.fg, bg = c.bg }), -- Normal text
        Cursor({ fg = c.bg, bg = c.fg }), -- Character under the cursor
        CurSearch({ fg = c.bg, bg = theme.teal }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
        Visual({ bg = theme.selection }), -- Visual mode selection

        Conceal({}), -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Directory({}), -- Directory names (and other special names in listings)
        DiffAdd({}), -- Diff mode: Added line |diff.txt|
        DiffChange({}), -- Diff mode: Changed line |diff.txt|
        DiffDelete({}), -- Diff mode: Deleted line |diff.txt|
        DiffText({}), -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer({}), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor({ Cursor }), -- Cursor in a focused terminal
        ErrorMsg({ fg = c.warn }), -- Error messages on the command line
        SignColumn({ Normal }), -- Column where |signs| are displayed
        IncSearch({ fg = c.bg, bg = theme.teal }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute({}), -- |:substitute| replacement text highlighting
        CursorLine({ Normal }),
        LineNr({ fg = theme.green }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove({ fg = theme.comment }), -- Line number for when the 'relativenumber' option is set, above the cursor line
        LineNrBelow({ fg = theme.comment }), -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr({}), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        CursorLineFold({}), -- Like FoldColumn when 'cursorline' is set for the cursor line
        CursorLineSign({}), -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen({}), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg({}), -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea({}), -- Area for messages and cmdline
        MsgSeparator({}), -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg({}), -- |more-prompt|
        NonText({}), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        NormalFloat({}), -- Normal text in floating windows.
        FloatBorder({}), -- Border of floating windows.
        FloatTitle({}), -- Title of floating windows.
        NormalNC({}), -- normal text in non-current windows
        Pmenu({}), -- Popup menu: Normal item.
        PmenuSel({}), -- Popup menu: Selected item.
        PmenuKind({}), -- Popup menu: Normal item "kind"
        PmenuKindSel({}), -- Popup menu: Selected item "kind"
        PmenuExtra({}), -- Popup menu: Normal item "extra text"
        PmenuExtraSel({}), -- Popup menu: Selected item "extra text"
        PmenuSbar({}), -- Popup menu: Scrollbar.
        PmenuThumb({}), -- Popup menu: Thumb of the scrollbar.
        Question({}), -- |hit-enter| prompt and yes/no questions
        QuickFixLine({}), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search({ fg = c.bg, bg = theme.orange }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SpecialKey({}), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad({}), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap({}), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal({}), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare({}), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine({}), -- Status line of current window
        StatusLineNC({}), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine({}), -- Tab pages line, not active tab page label
        TabLineFill({}), -- Tab pages line, where there are no labels
        TabLineSel({}), -- Tab pages line, active tab page label
        Title({}), -- Titles for output from ":set all", ":autocmd" etc.
        VisualNOS({}), -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg({}), -- Warning messages
        Whitespace({}), -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator({}), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu({}), -- Current match in 'wildmenu' completion
        WinBar({}), -- Window bar of current window
        WinBarNC({}), -- Window bar of not-current windows

        Comment({ fg = theme.comment }), -- Any comment
        Constant({ fg = theme.yellow }), -- (*) Any constant
        String({ fg = c.string }), --   A string constant: "this is a string"
        Character({ fg = theme.yellow }), --   A character constant: 'c', '\n'
        Number({ fg = c.number }), --   A number constant: 234, 0xff
        Boolean({ Number }), --   A boolean constant: TRUE, false
        Float({ Number }), --   A floating point constant: 2.3e10

        Identifier({ fg = c.fg }), -- (*) Any variable name
        Function({ fg = c.func }), --   Function name (also: methods for classes)
        Field({ fg = c.field }),

        Keyword({ fg = c.keyword }), --   any other keyword
        Statement({ Keyword }), -- (*) Any statement
        Conditional({ Statement }), --   if, then, else, endif, switch, etc.
        Repeat({ Statement }), --   for, do, while, etc.
        Label({ Statement }), --   case, default, etc.
        Operator({ fg = c.operator }), --   "sizeof", "+", "*", etc.
        Exception({ Statement }), --   try, catch, throw

        PreProc({}), -- (*) Generic Preprocessor
        Include({}), --   Preprocessor #include
        Define({}), --   Preprocessor #define
        Macro({}), --   Same as Define
        PreCondit({}), --   Preprocessor #if, #else, #endif, etc.

        Type({ fg = c.type }), -- (*) int, long, char, etc.
        StorageClass({}), --   static, register, volatile, etc.
        Typedef({ fg = c.type }), --   A typedef

        Special({ fg = c.special }), -- (*) Any special symbol
        SpecialChar({}), --   Special character in a constant
        Tag({}), --   You can use CTRL-] on this
        Delimiter({ Normal }), --   Character that needs attention
        SpecialComment({}), --   Special things inside a comment (e.g. '\n')
        Debug({}), --   Debugging statements

        Underlined({ gui = "underline" }), -- Text that stands out, HTML links
        Ignore({ Comment }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error({ fg = c.error }), -- Any erroneous construct
        Todo({ fg = theme.yellow }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        LspReferenceText({}), -- Used for highlighting "text" references
        LspReferenceRead({}), -- Used for highlighting "read" references
        LspReferenceWrite({}), -- Used for highlighting "write" references
        LspCodeLens({}), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        LspCodeLensSeparator({}), -- Used to color the seperator between two or more code lens.
        LspSignatureActiveParameter({}), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        DiagnosticError({ fg = c.error }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn({ fg = c.warn }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo({ fg = c.info }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint({ fg = c.hint }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticOk({ fg = c.ok }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticVirtualTextError({ DiagnosticError }), -- Used for "Error" diagnostic virtual text.
        DiagnosticVirtualTextWarn({ DiagnosticWarn }), -- Used for "Warn" diagnostic virtual text.
        DiagnosticVirtualTextInfo({ DiagnosticInfo }), -- Used for "Info" diagnostic virtual text.
        DiagnosticVirtualTextHint({ DiagnosticHint }), -- Used for "Hint" diagnostic virtual text.
        DiagnosticVirtualTextOk({ DiagnosticOk }), -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError({}), -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn({}), -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo({}), -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint({}), -- Used to underline "Hint" diagnostics.
        DiagnosticUnderlineOk({}), -- Used to underline "Ok" diagnostics.
        DiagnosticFloatingError({ DiagnosticError }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        DiagnosticFloatingWarn({ DiagnosticWarn }), -- Used to color "Warn" diagnostic messages in diagnostics float.
        DiagnosticFloatingInfo({ DiagnosticInfo }), -- Used to color "Info" diagnostic messages in diagnostics float.
        DiagnosticFloatingHint({ DiagnosticHint }), -- Used to color "Hint" diagnostic messages in diagnostics float.
        DiagnosticFloatingOk({ DiagnosticOk }), -- Used to color "Ok" diagnostic messages in diagnostics float.
        DiagnosticSignError({ DiagnosticError }), -- Used for "Error" signs in sign column.
        DiagnosticSignWarn({ DiagnosticWarn }), -- Used for "Warn" signs in sign column.
        DiagnosticSignInfo({ DiagnosticInfo }), -- Used for "Info" signs in sign column.
        DiagnosticSignHint({ DiagnosticHint }), -- Used for "Hint" signs in sign column.
        DiagnosticSignOk({ DiagnosticOk }), -- Used for "Ok" signs in sign column.

        sym("@text.literal")({ Comment }), -- Comment
        sym("@text.reference")({ Identifier }), -- Identifier
        sym("@text.title")({ Title }), -- Title
        sym("@text.uri")({ Underlined }), -- Underlined
        sym("@text.underline")({ Underlined }), -- Underlined
        sym("@text.todo")({ Todo }), -- Todo
        sym("@comment")({ Comment }), -- Comment
        sym("@punctuation")({ fg = theme.punc }), -- Delimiter
        sym("@punctuation.bracket")({ Normal }), -- Delimiter
        sym("@constant")({ Constant }), -- Constant
        sym("@constant.builtin")({ Special }), -- Special
        sym("@constant.macro")({ Define }), -- Define
        sym("@define")({ Define }), -- Define
        sym("@macro")({ Macro }), -- Macro
        sym("@string")({ String }), -- String
        sym("@string.escape")({ SpecialChar }), -- SpecialChar
        sym("@string.special")({ SpecialChar }), -- SpecialChar
        sym("@character")({ Character }), -- Character
        sym("@character.special")({ SpecialComment }), -- SpecialChar
        sym("@number")({ Number }), -- Number
        sym("@boolean")({ Boolean }), -- Boolean
        sym("@float")({ Float }), -- Float
        sym("@function")({ Function }), -- Function
        sym("@function.builtin")({ Special }), -- Special
        sym("@function.macro")({ Macro }), -- Macro
        sym("@parameter")({ Identifier }), -- Identifier
        sym("@method")({ Function }), -- Function
        sym("@field")({ Field }), -- Identifier
        sym("@property")({ Field }), -- Identifier
        sym("@constructor")({ Special }), -- Special
        sym("@conditional")({ Conditional }), -- Conditional
        sym("@repeat")({ Repeat }), -- Repeat
        sym("@label")({ Label }), -- Label
        sym("@operator")({ Operator }), -- Operator
        sym("@keyword")({ Keyword }), -- Keyword
        sym("@exception")({ Exception }), -- Exception
        sym("@variable")({ Identifier }), -- Identifier
        sym("@type")({ Type }), -- Type
        sym("@type.definition")({ Typedef }), -- Typedef
        sym("@storageclass")({ StorageClass }), -- StorageClass
        sym("@structure")({ Type }), -- Structure
        sym("@namespace")({ Identifier }), -- Identifier
        sym("@include")({ Include }), -- Include
        sym("@preproc")({ PreProc }), -- PreProc
        sym("@debug")({ Debug }), -- Debug
        sym("@tag")({ Tag }), -- Tag

        IblIndent({ fg = hsl(94, 22, 15), gui = "nocombine" }),
        IblWhitespace({ fg = hsl(94, 22, 15), gui = "nocombine" }),
        IblScope({ fg = hsl(72, 27, 23), gui = "nocombine" }),

        TodoBGREFACTOR({ fg = c.bg, bg = theme.comment, gui = "bold" }),
        TodoFGREFACTOR({ fg = theme.comment }),
        TodoBGTODO({ TodoBGREFACTOR }),
        TodoFGTODO({ TodoFGREFACTOR }),
        -- TodoBGTODO({ fg = c.bg, bg = theme.yellow, gui = "bold" }),
        -- TodoFGTODO({ Todo }),
    }
end)

return theme

-- vi:nowrap
