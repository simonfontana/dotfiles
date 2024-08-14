require('dapui').setup()
require('dap-go').setup()
require('dap-python').setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
