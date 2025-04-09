local colorscheme = require("lush_theme.monalisa")
local lushwright = require("shipwright.transform.lush")

-- export to lua
run(
    colorscheme,
    lushwright.to_lua,
    { patchwrite, "colors/monalisa.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
