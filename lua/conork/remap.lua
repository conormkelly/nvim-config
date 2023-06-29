vim.g.mapleader = " "

-- Project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)

-- Source config
vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- Quickfix List navigation
vim.keymap.set("n", "<C-j>", vim.cmd.cprev)
vim.keymap.set("n", "<C-k>", vim.cmd.cnext)

-- Clear search highlighting on Esc
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })

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
vim.keymap.set("n", "<leader>F", function()
    vim.lsp.buf.format()
end)

-- Prevent quit on Q
vim.keymap.set("n", "Q", "<nop>")

-- Move code up
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Move code down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })

-- Indent / Dedent
vim.keymap.set('n', '<leader>[', "<<", { silent = true })
vim.keymap.set('n', '<leader>]', ">>", { silent = true })

-- Match completion functionality
-- (toggle autocomplete of brackets, quotes etc)

-- Define a variable to keep track of whether "match completion" is enabled
vim.g.match_completion_enabled = 1

-- Define a command to toggle "match completion"
vim.cmd([[
  function! ToggleMatchCompletion()
    " Toggle the variable
    let g:match_completion_enabled = !g:match_completion_enabled

    " Display a message indicating whether "match completion" is now enabled or disabled
    if g:match_completion_enabled
        lua vim.notify("Match completion enabled", vim.log.levels.INFO)
    else
        lua vim.notify("Match completion disabled", vim.log.levels.WARN)
    endif
  endfunction
]])

-- Map <leader>mm to the command that toggles "match completion"
vim.api.nvim_set_keymap('n', '<leader>mc', ':call ToggleMatchCompletion()<cr>', { noremap = true, silent = true })

-- Define the CompleteMatch function
vim.cmd([[
  function! CompleteMatch(char, end_char)
    if g:match_completion_enabled
      " If "match completion" is enabled, insert the character and its match, and move the cursor to the left
      return a:char . a:end_char . "\<Left>"
    else
      " If "match completion" is not enabled, just insert the character
      return a:char
    endif
  endfunction
]])

-- Define the mappings
vim.api.nvim_set_keymap('i', '{', [[v:lua.vim.call("CompleteMatch", '{', '}')]],
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '(', [[v:lua.vim.call("CompleteMatch", '(', ')')]],
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '[', [[v:lua.vim.call("CompleteMatch", '[', ']')]],
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '"', [[v:lua.vim.call("CompleteMatch", '"', '"')]],
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', "'", [[v:lua.vim.call("CompleteMatch", "'", "'")]],
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '`', [[v:lua.vim.call("CompleteMatch", '`', '`')]],
    { noremap = true, expr = true, silent = true })
