vim.g.mapleader = " "

-- Project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)

-- Source config
vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- Quickfix List navigation
vim.keymap.set("n", "<C-j>", vim.cmd.cprev)
vim.keymap.set("n", "<C-k>", vim.cmd.cnext)

-- Clear search highlighting on Esc
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", {silent = true})

-- Overwrite maintaining paste register
vim.keymap.set("v", "<leader>p", '"_dP')

-- Copy entire file to clipboard
vim.keymap.set("n", "<leader>C", 'gg"+yG<C-o>')

-- Copy selection to clipboard
vim.keymap.set("v", "<C-c>", '"+y')

-- Better navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Format on Ctrl+F
vim.keymap.set("n", "<leader>F", function ()
    vim.lsp.buf.format()
end)

-- Prevent quit on Q
vim.keymap.set("n", "Q", "<nop>")

-- Move code up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {silent = true})

-- Move code down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {silent = true})

-- Indent / Dedent
vim.keymap.set('n', '<leader>[', "<<", {silent = true})
vim.keymap.set('n', '<leader>]', ">>", {silent = true})

