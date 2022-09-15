""lua << EOF
""require("flutter-tools").setup{
""  flutter_path = "/opt/flutter/bin/flutter",
""  flutter_hot_reload_on_save = true,
""}
""
""local map = vim.api.nvim_set_keymap
""
""options = { noremap = true }
""map('n','<leader>rf',  ':FlutterRun <cr>', options)
""map('n','<leader>rr',  ':FlutterHotRestart <cr>', options)
""map('n','<leader>rR',  ':FlutterHotReload <cr>', options)
""
""
""EOF
