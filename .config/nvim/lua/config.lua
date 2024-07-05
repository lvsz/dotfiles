local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'neovim/nvim-lspconfig',           -- lsp config
    'astral-sh/ruff-lsp',              -- python lsp
    'nvim-treesitter/nvim-treesitter', -- parsing/highlighting
    'tpope/vim-fugitive',              -- git commands
    'dense-analysis/ale',              -- linting
    'jpalardy/vim-slime',              -- superior lisp interaction mode for emacs
    'SirVer/ultisnips',                -- snippets
    {
        -- colorschemes
        'catppuccin/nvim', name = 'catppuccin',
        priority = 1000,
    },
    {
        -- autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'petertriho/cmp-git',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
    },
    {
        -- file finder
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        -- navigate between tmux panes & nvim splits
        'christoomey/vim-tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious',
        },
        keys = {
            { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
            { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
            { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
            { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
            { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
        },
    },
})
