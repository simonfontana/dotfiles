-- Highlight on yank (copied from kickstart.nvim)
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
    group = highlight_group,
    pattern = '*',
})