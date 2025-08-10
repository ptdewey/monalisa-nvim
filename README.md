<h1 align="center">MonaLisa</h1>

<p align="center">A dark and colorful theme for Neovim</p>

![MonaLisa Screenshot with a few windows](./assets/screenshot1.png)

Inspired by the painting and the iterm2 theme.


## Installation

`lazy.nvim`:
```lua
{
    "ptdewey/monalisa-nvim",
    priority = 1000,
}
```

`vim.pack`:
```lua
vim.pack.add({ "https://github.com/ptdewey/monalisa-nvim" })
```

## Usage

```lua
vim.cmd.colorscheme("monalisa")
```

## Build or Modify

1. [fennel](https://github.com/bakpakin/Fennel) or [hotpot.nvim](https://github.com/rktjmp/hotpot.nvim/tree/main) is installed
2. Modify [fnl/monalisa/init.fnl](fnl/monalisa/init.fnl) as desired
3. Rebuild the colorscheme 
    - With `fennel`: Use `./build.sh` or `just build`
    - With `hotpot.nvim`: Builds are automatic upon saving `fnl/monalisa/init.fnl`

Note: The version of monalisa made with [lush](https://github.com/rktjmp/lush.nvim) can be found on the [v1 branch](https://github.com/ptdewey/monalisa-nvim/tree/v1)
