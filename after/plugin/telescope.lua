local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


require("telescope").setup({


    -- defaults = {
    --
    --     mappings = {
    --
    --         n = {
    --             ["K"] = function () end,
    --             ["<C-k>"] = false,
    --             ["<C-w>k"] = false,
    --         }
    --     }
    -- }
    --
    -- defaults = {
    --     mappings = {
    --         i = {
    --             ["<c-]>"] = require('telescope.builtin').lsp_definitions,
    --             -- disable the shift+k mapping
    --             ["<plug>telescopefzfwriter_no_map_k"] = "k",
    --         },
    --     },
    -- },

})

-- require("telescope").setup({
-- })

-- lsp.on_attack(function(client, bufnr)
--     local opts = {buffer = bufnr, remap = false}
--
--     vim.keymap.set("n", "gd", function() builtin.lsp_definitions(), opts)
-- end)
