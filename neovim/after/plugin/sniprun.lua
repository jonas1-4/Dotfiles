vim.keymap.set("n", "<Leader>r", ":SnipRun<CR>", options)
vim.keymap.set("v", "<Leader>r", ":'<,'>SnipRun<CR>", options)
vim.g.markdown_fenced_languages = { "dart", "bash", "lua", "go", "rust", "c", "cpp" }
