-- https://github.com/catppuccin/nvim/blob/main/README.md
require('catppuccin').setup({
    flavour = 'mocha',
    background = {
        lith = "latte",
        dark = "mocha",
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    default_integrations = true,
    integrations = {
        treesitter = true,
    },
})

vim.cmd.colorscheme "catppuccin"
