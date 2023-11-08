-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 200
        end,
        opts = {},
    },

    -- mason
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'folke/neodev.nvim',
        }
    },

    -- cmp
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
            },
        }
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- colorscheme
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        priority = 999,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },

    -- several small plugins such as file explorer.
    {
        'echasnovski/mini.nvim',
        version = '*',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = true,
    },

    -- other
    { 'RRethy/vim-illuminate' },
    { 'numToStr/Comment.nvim', opts = {} },
})
