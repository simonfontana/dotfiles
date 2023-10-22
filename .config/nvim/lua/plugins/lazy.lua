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
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},

  -- lsp
  {"neovim/nvim-lspconfig"},

  -- cmp
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"L3MON4D3/LuaSnip"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-nvim-lsp-signature-help"},
})
