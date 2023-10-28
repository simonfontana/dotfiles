vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require('plugins.lazy')

require('plugins.lualine')

require('plugins.mason')
require('plugins.treesitter')

require('lsp.gopls')

require('telescope').load_extension('fzf')

require('simonfontana')
