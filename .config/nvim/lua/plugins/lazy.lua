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
    { "saadparwaiz1/cmp_luasnip" },

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
    { "catppuccin/nvim",                name = "catppuccin", priority = 1000 },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        priority = 999,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },

    -- debug
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        }
    },
    { "theHamsta/nvim-dap-virtual-text" },
    { "leoluz/nvim-dap-go" },
    { "mfussenegger/nvim-dap-python" },

    -- several small plugins such as file explorer.
    -- {
    --     'echasnovski/mini.nvim',
    --     version = '*',
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     lazy = true,
    -- },
    -- file tree
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    -- neotest
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                adapters = {
                    require("neotest-go")({
                        experimental = {
                            test_table = true,
                        },
                        args = { "-count=1", "-timeout=60s" }
                    }),
                    require("neotest-python"),
                },
            })
        end,
    },

    -- other
    { 'RRethy/vim-illuminate' },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6', --recomended as each new version will have breaking changes
        opts = {},
    },

    {
        "yanskun/gotests.nvim",
        ft = "go",
        config = function()
            require("gotests").setup()
        end,
    },

    { 'TabbyML/vim-tabby' },

    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    { "lewis6991/gitsigns.nvim" },
})
