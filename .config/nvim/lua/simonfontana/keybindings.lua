local default_opts = { noremap = true, silent = true }

local modes = {
    insert_mode = default_opts,
    normal_mode = default_opts,
    visual_mode = default_opts,
    visual_block_mode = default_opts,
    command_mode = default_opts,
    operator_pending_mode = default_opts,
    term_mode = { silent = true },
}

local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
    operator_pending_mode = "o",
}

local mappings = {
    insert_mode = {
        -- Move current line / block
        ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        ["<A-k>"] = "<Esc>:m .-2<CR>==gi",

        -- Luasnip navigation
        ["<C-j>"] = function() require("luasnip").expand() end,
        ["<C-l>"] = function() require("luasnip").jump(1) end,
        ["<C-h>"] = function() require("luasnip").jump(-1) end,
    },

    normal_mode = {
        -- Window movement
        ["<C-h>"] = "<C-w>h",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",

        -- Resize with arrows
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",

        -- Move current line / block with Alt-j/k a la vscode
        ["<A-j>"] = ":m .+1<CR>==",
        ["<A-k>"] = ":m .-2<CR>==",

        -- Debug
        ["<F4>"] = ":lua require('dapui').toggle()<CR>",
        ["<F5>"] = ":DapToggleBreakpoint<CR>",
        ["<F9>"] = ":DapContinue<CR>",

        ["<F1>"] = ":DapStepOver<CR>",
        ["<F2>"] = ":DapStepInto<CR>",
        ["<F3>"] = ":DapStepOut<CR>",
    },

    visual_mode = {
        -- Better indenting
        ["<"] = "<gv",
        [">"] = ">gv",
    },

    visual_block_mode = {
        -- Move current line / block
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
}


local function set_keymap(mode, key, val)
    local opt = modes[mode] or default_opts
    vim.keymap.set(mode, key, val, opt)
end

for mode, mapping in pairs(mappings) do
    mode = mode_adapters[mode] or mode
    for k, v in pairs(mapping) do
        set_keymap(mode, k, v)
    end
end

-- which-key mappings
vim.g.mapleader = " "

local which_key = require("which-key")
which_key.setup({
    presets = {
        operators = true,    -- adds help for operators like d, y, ...
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
    },
})

local wk_mappings = {
    normal_mode = {
        ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
        -- TODO: "b" is reserved for buffer
        d = {
            name = "Debug",
            b = { "<cmd>DapToggleBreakpoint<CR>", "Breakpoint" },
            c = { "<cmd>DapContinue<CR>", "Continue" },
            i = { "<cmd>DapStepInto<CR>", "Step Into" },
            o = { "<cmd>DapStepOver<CR>", "Step Over" },
            r = { "<cmd>lua require('dapui').open({reset=true})<CR>", "Reload Window" },
            u = { "<cmd>DapStepOut<CR>", "Step Out" },
            w = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Window" },

            h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
            j = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Hover Visual" },
        },
        a = { "<cmd>AerialToggle<CR>", "Aerial" },
        -- e = { "<cmd>lua MiniFiles.open()<CR>", "Explorer" },
        e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
        f = {
            name = "Find",
            b = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
            C = { "<cmd>Telescope commands<cr>", "Commands" },
            d = { "<cmd>Telescope find_files<cr>", "Files in current working directory" },
            f = { "<cmd>Telescope git_files<cr>", "Files in project" },
            g = { "<cmd>Telescope live_grep<cr>", "Grep for string" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
            w = { "<cmd>Telescope grep_string<cr>", "Grep for word under cursor" },
        },
        g = {
            name = "Git",
            b = { "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Blame" },
            d = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
            D = { "<cmd>Gitsigns diffthis<CR>", "Diff" },
            p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
            r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
            s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        },
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
            f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
            h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover documentation" },
            i = { "<cmd>LspInfo<cr>", "Info" },
            -- TOREMOVE: learn "]d" instead
            -- n = {
            --     "<cmd>lua vim.diagnostic.goto_next()<cr>",
            --     "Next Diagnostic",
            -- },
            -- TOREMOVE: learn "[d" instead
            -- p = {
            --     "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            --     "Prev Diagnostic",
            -- },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature documentation" },
        },
        q = { "<cmd>confirm q<CR>", "Quit" },
        t = {
            name = "Test",
            -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
            d = { "<cmd>lua require('dap-go').debug_test()<CR>", "Debug Nearest Test (Golang)" },
            D = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", "Debug Nearest Test (any language)" },
            f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run Tests In File" },
            g = { "<cmd>GoTests<CR>", "Generate" },
            r = { "<cmd>lua require('neotest').run.run()<CR>", "Run Nearest Test" },
            s = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Summary Window" },
            w = { "<cmd>lua require('neotest').watch.toggle()<CR>", "Toggle Watch" },
            x = { "<cmd>lua require('neotest').diagnostic<CR>", "" },
        },
        w = { "<cmd>w!<CR>", "Save" },
    },

    visual_mode = {
        ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
            f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
        },
    },
}

for mode, mappings in pairs(wk_mappings) do
    which_key.register(mappings, { prefix = "<leader>", mode = mode_adapters[mode] })
end
