vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require('plugins.lazy')

require('plugins.lualine')

require('plugins.mason')
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
-- require('plugins.luasnip')
require('plugins.treesitter')
require('lsp')

require('plugins.telescope')


require('simonfontana')
-- require('mini.files').setup()

require('plugins.tabby')
require("nvim-tree").setup()

require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    -- layout = {
    --     default_direction = "float"
    -- }
})

require('gitsigns').setup()

require('plugins.debug')
