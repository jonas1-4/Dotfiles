local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
-- Make the breakpoints look nicer
-- In your configuration, put this to change the ugly B text for these icons
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
-- Set some keymaps
vim.keymap.set('n', '<leader>dc', require 'dap'.continue)
vim.keymap.set('n', '<leader>do', require 'dap'.step_over)
vim.keymap.set('n', '<leader>di', require 'dap'.step_into)
vim.keymap.set('n', '<leader>db', require 'dap'.step_out)
vim.keymap.set('n', '<leader>dd', require 'dap'.toggle_breakpoint)
