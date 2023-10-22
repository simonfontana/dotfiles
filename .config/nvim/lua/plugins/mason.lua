require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', ' lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, ' lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end
})

local default_setup = function(server)
    lspconfig[server].setup({})
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        lua_ls = function()
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
        end,
    },
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl + space triggers completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
