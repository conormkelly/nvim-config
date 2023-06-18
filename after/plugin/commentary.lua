vim.keymap.set('n', "<C-/>", vim.cmd.Commentary)

vim.keymap.set('v', '<C-/>', function()
    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]
    vim.cmd(start_line .. "," .. end_line .. "Commentary")
end)
