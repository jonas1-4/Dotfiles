vim.wo.relativenumber = true
vim.wo.nu = true

vim.wo.wrap = false

vim.o.scrolloff = 100
vim.o.tabstop = 4
vim.opt.autoindent = false
vim.opt.expandtab = true
p 
vim.opt.shiftwidth = 4
vim.o.clipboard = 'unnamedplus'
vim.o.list = true
vim.opt.listchars='tab:>-'

-- vim.o.vimDir ='$HOME/.vim';


-- Save undos between sessions
vim.opt.undofile = true
-- Specify the directory where undo files are stored
-- vim.opt.undodir = "$HOME/.undodir"
vim.opt.undolevels = 10000  -- This allows for 1000 undos
