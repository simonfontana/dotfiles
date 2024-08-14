vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.colorcolumn      = "120"

vim.opt.number           = true
vim.opt.relativenumber   = true
vim.opt.cursorline       = true

-- Share clipboard with OS.
vim.opt.clipboard        = 'unnamedplus'

vim.o.completeopt        = 'menuone,noselect'

-- Disabling netrw is recommended by nvim documentation.
-- Fake that netrw is already setup:
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Display NVIM title in the OS window.
vim.opt.title            = true
