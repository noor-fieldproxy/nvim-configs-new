
vim.opt.termguicolors = true


require("bufferline").setup({
    options = {

        diagnostics = "nvim_lsp" , --"coc" | false
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer"  ,
                text_align = "center" ,
                separator = true
            }
        },
    },
})
