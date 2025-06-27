local lush = require("lush")

local hsl = lush.hsl

-- Unused colors
-- yellow = "#f6d666", -- Core from iterm, not used
-- red = "#992a21", -- core from iterm, not used
-- crimson = "#991f2d", -- core from iterm, not used
-- teal = "#598058" -- core teal
-- crimson = "#b94649",
-- darkYellow = "#c7ad53",
-- darkYellow = "#d9b054",
-- darkYellow = "#a18954",
-- brightGreen = "#b4b264",
-- fg = "#f7e7ae",
-- altBlue = "#51605b",
-- blueGreen = hsl("#4c584a").lighten(10), -- lightened version is equivalent to blueGreen
-- brightBlack = "#874228",
-- hsl("#231a1d").lighten(5)
-- brown = "#341b0f", -- Core color from iterm, but not visible on background (light mode fg?)

local colors = {
    black = "#120b0d",
    tan = "#ffe598",
    red = "#ca5443",
    green = "#636135",
    blue = "#525c5d",
    crimson = "#9e333f",
    orange = "#c16e31",
    teal = "#476746",

    brightGreen = "#928f4e",
    darkOrange = "#9a5727",
    blueGreen = "#5D6C5A",
    darkYellow = "#bb8a3e",

    comment = "#514743",
    punc = "#6a5f3f",
    selection = "#2F2327",
}

local c = {
    bg = colors.black,
    fg = colors.tan,
    delimiter = colors.tan,
    operator = colors.blueGreen,
    number = colors.crimson,
    constant = colors.crimson,
    string = colors.darkYellow,
    special = colors.darkOrange,
    keyword = colors.brightGreen,
    func = colors.green,
    type = colors.darkOrange,
    builtinType = colors.blueGreen,
    builtinFunc = colors.darkOrange, -- TODO: decide between green, teal, blueGreen
    field = colors.teal, -- TODO: figure out this one between teal, orange, darkYellow

    error = colors.crimson,
    warn = colors.darkOrange,
    info = colors.blueGreen,
    hint = colors.comment,
    ok = colors.brightGreen,
    comment = colors.comment,
    punc = colors.punc,
    selection = colors.selection,
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        Normal({ fg = c.fg, bg = c.bg }), -- Normal text
        Cursor({ fg = c.bg, bg = c.fg }), -- Character under the cursor
        Visual({ bg = c.selection }), -- Visual mode selection

        Search({ fg = c.fg, bg = c.constant }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        CurSearch({ fg = c.fg, bg = colors.green }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
        IncSearch({ fg = c.fg, bg = c.string }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

        Conceal({}), -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Directory({ fg = colors.green }), -- Directory names (and other special names in listings)
        DiffAdd({ fg = colors.green }), -- Diff mode: Added line |diff.txt|
        DiffChange({ fg = c.comment }), -- Diff mode: Changed line |diff.txt|
        DiffDelete({ fg = c.error }), -- Diff mode: Deleted line |diff.txt|
        DiffText({}), -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer({ fg = hsl(c.comment).darken(20) }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor({ Cursor }), -- Cursor in a focused terminal
        ErrorMsg({ fg = c.warn }), -- Error messages on the command line
        SignColumn({ Normal }), -- Column where |signs| are displayed
        Substitute({ IncSearch }), -- |:substitute| replacement text highlighting
        CursorLine({}),
        LineNr({ fg = colors.green }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove({ fg = c.comment }), -- Line number for when the 'relativenumber' option is set, above the cursor line
        LineNrBelow({ fg = c.comment }), -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr({}), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        CursorLineFold({}), -- Like FoldColumn when 'cursorline' is set for the cursor line
        CursorLineSign({}), -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen({}), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg({}), -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea({}), -- Area for messages and cmdline
        MsgSeparator({}), -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg({}), -- |more-prompt|
        NonText({}), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        NormalFloat({ Normal }), -- Normal text in floating windows.
        FloatBorder({}), -- Border of floating windows.
        FloatTitle({}), -- Title of floating windows.
        NormalNC({}), -- normal text in non-current windows
        Pmenu({ Normal }), -- Popup menu: Normal item.
        PmenuSel({ fg = c.fg, bg = colors.brightGreen }), -- Popup menu: Selected item.
        PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
        PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
        PmenuExtra({ Pmenu }), -- Popup menu: Normal item "extra text"
        PmenuExtraSel({ Pmenu }), -- Popup menu: Selected item "extra text"
        PmenuSbar({ Normal }), -- Popup menu: Scrollbar.
        PmenuThumb({ Normal }), -- Popup menu: Thumb of the scrollbar.
        Question({}), -- |hit-enter| prompt and yes/no questions
        QuickFixLine({}), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        SpecialKey({}), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad({ fg = c.comment }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellBad({}), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap({}), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal({}), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare({}), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine({ bg = hsl(c.bg).lighten(1) }), -- Status line of current window
        StatusLineNC({ StatusLine }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine({}), -- Tab pages line, not active tab page label
        TabLineFill({}), -- Tab pages line, where there are no labels
        TabLineSel({ bg = c.builtinType }), -- Tab pages line, active tab page label
        Title({ fg = c.builtinType }), -- Titles for output from ":set all", ":autocmd" etc.
        VisualNOS({}), -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg({}), -- Warning messages
        Whitespace({}), -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator({}), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu({}), -- Current match in 'wildmenu' completion
        WinBar({}), -- Window bar of current window
        WinBarNC({}), -- Window bar of not-current windows

        Comment({ fg = c.comment }), -- Any comment
        Constant({ fg = c.constant }), -- (*) Any constant
        Boolean({ Constant }), --   A boolean constant: TRUE, false
        String({ fg = c.string }), --   A string constant: "this is a string"
        Character({ String }), --   A character constant: 'c', '\n'
        Number({ fg = c.number }), --   A number constant: 234, 0xff
        Float({ Number }), --   A floating point constant: 2.3e10

        Identifier({ fg = c.fg }), -- (*) Any variable name
        Function({ fg = c.func }), --   Function name (also: methods for classes)
        Field({ fg = c.field }),

        Keyword({ fg = c.keyword }), --   any other keyword
        Statement({ Keyword }), -- (*) Any statement
        Conditional({ Statement }), --   if, then, else, endif, switch, etc.
        Repeat({ Statement }), --   for, do, while, etc.
        Label({ Statement }), --   case, default, etc.
        Exception({ Statement }), --   try, catch, throw
        Operator({ fg = c.operator }), --   "sizeof", "+", "*", etc.

        PreProc({ fg = c.builtinType }), -- (*) Generic Preprocessor
        Include({ PreProc }), --   Preprocessor #include
        Define({ PreProc }), --   Preprocessor #define
        Macro({ PreProc }), --   Same as Define
        PreCondit({ PreProc }), --   Preprocessor #if, #else, #endif, etc.

        Type({ fg = c.type }), -- (*) int, long, char, etc.
        StorageClass({ Type }), --   static, register, volatile, etc.
        Typedef({ Type }), --   A typedef

        Special({ fg = c.special }), -- (*) Any special symbol
        SpecialChar({ Special }), --   Special character in a constant
        Tag({ Special }), --   You can use CTRL-] on this
        Delimiter({ fg = c.delimiter }), --   Character that needs attention
        SpecialComment({}), --   Special things inside a comment (e.g. '\n')
        Debug({}), --   Debugging statements

        Underlined({ gui = "underline" }), -- Text that stands out, HTML links
        Ignore({ Comment }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error({ fg = c.error }), -- Any erroneous construct
        Todo({ fg = colors.yellow }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        LspReferenceText({ Normal }), -- Used for highlighting "text" references
        LspReferenceRead({}), -- Used for highlighting "read" references
        LspReferenceWrite({}), -- Used for highlighting "write" references
        LspCodeLens({}), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        LspCodeLensSeparator({}), -- Used to color the seperator between two or more code lens.
        LspSignatureActiveParameter({}), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
        LspInlayHint({ Comment }),

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
        DiagnosticUnderlineError({ Underlined }), -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn({ Underlined }), -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo({ Underlined }), -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint({ Underlined }), -- Used to underline "Hint" diagnostics.
        DiagnosticUnderlineOk({ Underlined }), -- Used to underline "Ok" diagnostics.
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
        sym("@punctuation")({ fg = c.punc }), -- Delimiter
        sym("@punctuation.bracket")({ Delimiter }), -- Delimiter
        sym("@constant")({ Constant }), -- Constant
        sym("@constant.builtin")({ Constant }), -- Special
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
        sym("@function.builtin")({ fg = c.builtinFunc }), -- Special
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
        sym("@type.builtin")({ fg = c.builtinType }), -- Type
        sym("@type.definition")({ Typedef }), -- Typedef
        sym("@storageclass")({ StorageClass }), -- StorageClass
        sym("@structure")({ Type }), -- Structure
        sym("@namespace")({ Identifier }), -- Identifier
        sym("@include")({ Include }), -- Include
        sym("@preproc")({ PreProc }), -- PreProc
        sym("@debug")({ Debug }), -- Debug
        sym("@tag")({ Tag }), --- Tag
        sym("@lsp.type.parameter")({ Identifier }),
        sym("@lsp.type.property")({ Identifier }),
        sym("@lsp.type.variable")({ Identifier }),

        sym("@lsp.type.derive")({ fg = colors.teal }),
        sym("@punctuation.special.rust")({ PreProc }),
        sym("@property.lua")({ Identifier }),
        sym("@markup.link")({ fg = hsl(72, 27, 40) }),
        sym("@markup.list")({ Operator }),
        sym("@markup.heading")({ Title }),
        sym("@marup.raw.block.markdown")({ Special }),
        sym("@html.comment")({ Comment }),
        sym("@tag.html")({ Special }),

        -- Plugins
        markdownBold({ gui = "bold" }),
        markdownItalic({ gui = "italic" }),

        FzfLuaSearch({ IncSearch }),
        FzfLuaCursorLineNr({ CursorLineNr }),
        FzfLuaScrollFloatEmpty({ PmenuSbar }),
        FzfLuaScrollFloatFull({ PmenuThumb }),
        FzfLuaCursorLine({ CursorLine }),
        FzfLuaCursor({ Cursor }),
        FzfLuaNormal({ Normal }),
        FzfLuaBorder({ Normal }),
        FzfLuaNormal({ Normal }),
        FzfLuaBorder({ Normal }),

        GitSignsAdd({ fg = colors.green }),
        GitSignsChange({ fg = c.punc }),
        GitSignsDelete({ fg = colors.darkOrange }),

        IblIndent({ fg = hsl(colors.teal).darken(70), gui = "nocombine" }),
        IblWhitespace({ fg = hsl(colors.teal).darken(70), gui = "nocombine" }),
        IblScope({ fg = hsl(colors.green).darken(40), gui = "nocombine" }),
    }
end)

return theme

-- vi:nowrap
