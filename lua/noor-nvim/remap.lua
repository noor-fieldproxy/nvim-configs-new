-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.mapleader = " "

-- This is for moving text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Even while appending it will stay in place
vim.keymap.set("n", "H", "mzJ`z")

-- This too are just zz ( center the screen)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever, this for highlight and paste, without losing the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland . For copy and pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- First one is for change everywhere
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- This is for buffer switching
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- This is for easy access of semicolon
vim.keymap.set("n", ";", ":")
vim.keymap.set("i", ";", ":")
vim.keymap.set("i", ":", ";")

-- This is for ' paste last think yanked not deleted '
vim.keymap.set("n", ",p", '"0p')
vim.keymap.set("n", ",P", '"0P')

-- This is for saving files
vim.keymap.set("n", "<leader>w", ":up<cr>")

-- Map tab and shift tab for indenting
vim.keymap.set("n", "<TAB>", ">>")
vim.keymap.set("n", "<S-TAB>", "<<")
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- To Switch between buffers



-- vim.cmd([[
--   autocmd FileType lspinfo nnoremap <buffer> K <Nop>
-- ]])
-- vim.api.nvim_set_keymap('n', 'K', '<Nop>', { noremap = true, silent = true })
vim.keymap.set("n", "K", function() return true end)  -- Update the K mapping
vim.keymap.set("n", "K", "<cmd>:bnext<CR>")
vim.keymap.set("n", "J", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>:bdelete<CR>")

------------------------------------------
---TESTING FOR LSP HOVER---



--------------------------------------------

-- This keybinding is for Newtr (inbuilt file explorer)
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- This uses Tmux to change between project folders
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Below Four are quickfix navigation, i have no idea what it is
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- This one is going to save bash script into exectuable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

---------------------------------------------

--" Shift-Tab Shift in visual mode to number lines...
-- xnoremap <S-TAB> :s/\%V/0<C-V><TAB>/<CR>gvg<C-A>gv:retab<ESC>gvI<C-G>u<ESC>gv


-- I tried this one to run a python file it works
-- vim.keymap.set(
-- -- Tried this command to run a python file (not working)
-- vim.api.nvim_create_autocmd("FileType", { pattern = "python3",
-- callback = function()
--     vim.api.nvim_buf_set_keymap(0,"n","<F9>","<Esc>:w<CR>:!clear;python %<CR>",opts)
-- end})


-- This is vim command to run a python files
-- autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
-- autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


-- Adding Python exectuable

-- vim.api.nvim_create_autocmd("FileType", { pattern = "cpp",
-- command = "nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i"})

-------------------------------------------

-- This piece of code below is for 'Closing unused buffers' <leader>b (https://www.reddit.com/r/neovim/comments/12c4ad8/closing_unused_buffers)

local id = vim.api.nvim_create_augroup("startup", {
    clear = false
})

local persistbuffer = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.fn.setbufvar(bufnr, 'bufpersist', 1)
end

vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = id,
    pattern = { "*" },
    callback = function()
        vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
            buffer = 0,
            once = true,
            callback = function()
                persistbuffer()
            end
        })
    end
})

vim.keymap.set('n', '<Leader>b',
    function()
        local curbufnr = vim.api.nvim_get_current_buf()
        local buflist = vim.api.nvim_list_bufs()
        for _, bufnr in ipairs(buflist) do
            if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
                vim.cmd('bd ' .. tostring(bufnr))
            end
        end
    end, { silent = true, desc = 'Close unused buffers' })

-----------------------------------------
