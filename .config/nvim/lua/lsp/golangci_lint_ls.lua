local lspconfig = require "lspconfig"

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}
