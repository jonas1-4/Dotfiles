require('leetbuddy').setup({
	language = "dart",
})

vim.keymap.set("n", '<leader>lq', '<cmd>LBQuestions<cr>', { noremap = true, silent = true, desc = 'List Questions' })
vim.keymap.set("n", '<leader>ll', '<cmd>LBQuestion<cr>', { noremap = true, silent = true, desc = 'View Question' })
vim.keymap.set("n", '<leader>lr', '<cmd>LBReset<cr>', { noremap = true, silent = true, desc = 'Reset Code' })
vim.keymap.set("n", '<leader>lt', '<cmd>LBTest<cr>', { noremap = true, silent = true, desc = 'Run Code' })
vim.keymap.set("n", '<leader>ls', '<cmd>LBSubmit<cr>', { noremap = true, silent = true, desc = 'Submit Code' })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
