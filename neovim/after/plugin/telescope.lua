local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"
require("telescope").setup(
    {
        extensions = {
            file_browser = { layout_strategy = "horizontal", sorting_strategy = "ascending" },
            heading = { treesitter = true,},
            ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
        },
        defaults = {
            cache_picker = { num_pickers = 10 },
            dynamic_preview_title = true,
            layout_strategy = "vertical",
            layout_config = {
                vertical = { width = 0.9, height = 0.9, preview_height = 0.6, preview_cutoff = 0 } },
            path_display = { "smart", shorten = { len = 3 } },
            wrap_results = true
        },
    }
)

-- require("telescope").find_files({
--   find_command = {'rg', '--files', '--hidden', '--with-filename', '--no-heading', '--line-number'}
-- })
require 'nvim-web-devicons'.setup {}

function FuzzyFindFiles()
    builtin.grep_string({
        path_display = { 'smart' },
        only_sort_text = true,
        word_match = "-w",
        search = '',
    })
end

vim.keymap.set('n', '<C-g>', '<cmd>lua fuzzyFindFiles{}<cr>', {}) -- map whatever you want, I use ctrl-g

vim.keymap.set('n', '<leader>pf', '<cmd>lua fuzzyFindFiles{}<cr>', {})
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

vim.keymap.set(
    "n",
    "<leader>ff", function()
        vim.cmd("Telescope file_browser path=%:p:h select_buffer=true")
        print('ha')
    end
)
