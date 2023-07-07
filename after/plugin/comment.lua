
-- Keymaps 
vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end)

vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Initialize
require("Comment").setup({
    module = "Comment",
    keys = {"gc", "gb"},
    
})
