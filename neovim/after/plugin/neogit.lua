local neogit = require('neogit')
local gruvbox = require('gruvbox')

neogit.setup {

}

vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#9d0006", bg = "#fb4934" })          -- Unstaged changes
vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = "#79740e", bg = "#b8bb26" })          -- Unstaged changes
vim.keymap.set("n", '<leader>gg', '<cmd>Neogit<cr>', { noremap = true, silent = true, desc = 'Open Neogit' })
