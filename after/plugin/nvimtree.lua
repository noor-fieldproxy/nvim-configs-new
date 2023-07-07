
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Keybindings for NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)


--  setup with some options
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort_by = "case_sensitive",
    view = {
        width = 45,
        adaptive_size = false,
        side = "right",
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "v", action = "vsplit" }
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    }
 
    -- ignore_ft_on_setup = {
    --     "startify"
    -- },
})
