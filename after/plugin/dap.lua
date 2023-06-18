require("dapui").setup()

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Toggle breakpoints with <leader>bp
vim.api.nvim_set_keymap('n', '<leader>bp', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })

-- Start debugger
_G.debug_and_open_dap_ui = function()
  local dap = require("dap")
  dap.continue()
  require("dapui").open()
end

-- Map the <F5> key to run the custom debug function
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua _G.debug_and_open_dap_ui()<CR>', { noremap = true, silent = true })

-- Stop debugging
map('n', '<F6>', '<cmd>lua require"dapui".close()<CR><cmd>lua require"dap".close()<CR>', options)

-- Quit debugging
_G.exit_debug_and_close_dap_ui = function()
  local dap = require("dap")
  dap.disconnect() -- Ends the current debug session
  dap.close() -- Closes the debug connection
  require("dapui").close() -- Closes the DAP UI
end

-- Map the <S-F5> (Shift + F5) key to run the custom exit debug function
vim.api.nvim_set_keymap('n', '<S-F5>', '<cmd>lua _G.exit_debug_and_close_dap_ui()<CR>', { noremap = true, silent = true })

-- Map the <leader>si key to step into
vim.api.nvim_set_keymap('n', '<leader>si', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })

-- Map the <leader>so key to step over
vim.api.nvim_set_keymap('n', '<leader>so', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })

-- Map the <leader>sO key to step out
vim.api.nvim_set_keymap('n', '<leader>sO', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })

local dap = require('dap')

dap.listeners.after.event_terminated['close_dapui'] = function()
    require('dapui').close()
    vim.api.nvim_command('normal! <C-o>')
end

dap.listeners.after.event_exited['close_dapui'] = function()
    require('dapui').close()
    vim.api.nvim_command('normal! <C-o>')
end

