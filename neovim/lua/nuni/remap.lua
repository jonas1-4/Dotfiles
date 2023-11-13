vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fs", vim.cmd.write)
vim.keymap.set("n", "<leader>fp", ":ex ~/.config/nvim/ <CR>")
vim.keymap.set("n", "<leader>bd", ":bd <CR>")
vim.keymap.set("n", "<leader>bj", ":bn <CR>")
vim.keymap.set("n", "<leader>bk", ":bp <CR>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("v", "D", '"_D')
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

vim.keymap.set("n", "<leader>et", "<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>")
vim.keymap.set("n", "<leader>rr", function()
	vim.cmd("source $MYVIMRC")
	print("Reloaded config!")
end)

vim.keymap.set("n", "<leader>rf", function()
	vim.cmd("source %")
	print("Reloaded file!")
end)
