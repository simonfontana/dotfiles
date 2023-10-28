local telescope = require('telescope')

telescope.load_extension('fzf')
telescope.setup({
    defaults = {
        layout_config = {
            -- can't be 1.0; https://github.com/nvim-telescope/telescope.nvim/issues/2508
            width = 0.99
        }
    }
})
