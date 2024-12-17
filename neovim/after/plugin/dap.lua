local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
-- dap.listeners.before.launch.dapui_config = function()
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--     dapui.close()
-- end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = "/Users/jonasackermann/fvm/default/bin/dart",
        flutterSdkPath = "/Users/jonasackermann/fvm/default/bin/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    },
    {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "/Users/jonasackermann/fvm/default/bin/dart",
        flutterSdkPath = "/Users/jonasackermann/fvm/default/bin/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    }
}

dap.adapters.dart = {
  type = 'executable',
  command = '/Users/jonasackermann/fvm/default/bin/dart',
  args = { 'debug_adapter' },
}
dap.adapters.flutter = {
  type = 'executable',
  command = '/Users/jonasackermann/fvm/default/bin/flutter',
  args = { 'debug_adapter' },
}

-- Make the breakpoints look nicer
-- In your configuration, put this to change the ugly B text for these icons
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
-- Set some keymaps
vim.keymap.set('n', '<leader>dc', require 'dap'.continue, { desc = 'Continue' })
vim.keymap.set('n', '<leader>do', require 'dap'.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<leader>di', require 'dap'.step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<leader>db', require 'dap'.step_out, { desc = 'Step Out' })
vim.keymap.set('n', '<leader>dd', require 'dap'.toggle_breakpoint, { desc = 'Toggle breakpoint' })
