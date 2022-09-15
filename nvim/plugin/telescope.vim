" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fS :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>


""lua require("telescope").load_extension("flutter")
lua require'telescope'.load_extension('project')
" nnoremap <leader>rR :lua require("telescope").extensions.flutter.commands()<cr>
nnoremap <leader>fp :lua require'telescope'.extensions.project.project{}<cr>
