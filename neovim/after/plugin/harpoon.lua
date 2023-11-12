local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set({"n","i"}, "<C-e>", ui.toggle_quick_menu)

vim.keymap.set({"n","i"}, "<C-h>", function () ui.nav_file(1) end)
vim.keymap.set({"n","i"}, "<C-t>", function () ui.nav_file(2) end)
vim.keymap.set({"n","i"}, "<C-n>", function () ui.nav_file(3) end)
vim.keymap.set({"n","i"}, "<C-s>", function () ui.nav_file(4) end)

vim.keymap.set({"n","i"}, "<C-j>", function () ui.nav_next() end)
vim.keymap.set({"n","i"}, "<C-k>", function () ui.nav_prev() end)
