vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require('plugins.lazy')

require('plugins.lualine')

require('plugins.mason')
require('plugins.luasnip')
require('plugins.treesitter')
require('lsp')

require('plugins.telescope')

require('simonfontana')
require('mini.files').setup()
