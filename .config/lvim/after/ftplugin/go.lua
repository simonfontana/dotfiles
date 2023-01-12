local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofumpt", filetypes = { "go" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "golangci_lint", filetypes = { "go" } },
}
