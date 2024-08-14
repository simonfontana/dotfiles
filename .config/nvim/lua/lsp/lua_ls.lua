-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require('neodev').setup()

require('lspconfig').lua_ls.setup({
    -- suppress warning of "vim" global
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },
        },
    },
})
