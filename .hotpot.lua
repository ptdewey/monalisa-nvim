return {
    build = {
        { atomic = false },
        {
            "fnl/monalisa/init.fnl",
            function()
                return "colors/monalisa.lua"
            end,
        },
    },
    clean = true,
}
