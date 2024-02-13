require("lazy").setup({

    -- morhetz/gruvbox config
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',
        config = function(plugin)
            local gruvbox = require 'gruvbox'

            gruvbox.setup({
                transparent_mode = false
            })

            vim.opt.termguicolors = true
            vim.o.background = 'dark'
            vim.cmd('colorscheme gruvbox')
        end,
        priority = 1000,
    },

    -- Core plugins
    { 'zbirenbaum/copilot.lua' },

    -- NeoTree related plugins
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },

    -- Telescope related plugins
    {
        'nvim-telescope/telescope.nvim',
        -- tag          = '0.1.0',
        dependencies = {
            "debugloop/telescope-undo.nvim",
            'nvim-lua/plenary.nvim',
            -- add other telescope related dependencies here
        },
        opts         = {
            -- Telescope specific configurations
        },
        config       = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        -- telescope-undo.nvim config, see below
                    },
                },
            })
            require("telescope").load_extension("undo")
        end,
    },

    -- Other plugins
    { 'MunifTanjim/prettier.nvim' },
    { 'Pocco81/auto-save.nvim' },
    { 'theprimeagen/harpoon' },
    { 'TimUntersberger/neogit',    dependencies = 'nvim-lua/plenary.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'glepnir/lspsaga.nvim' },
    { 'kabouzeid/nvim-lspinstall' },
    { 'windwp/nvim-autopairs' },
    { 'hrsh7th/nvim-compe' },
    { 'andymass/vim-matchup',      opts = function() vim.g.matchup_matchparen_offscreen = { method = 'popup' } end },
    { 'Dhanus3133/LeetBuddy.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' } },


    -- folke/trouble.nvim config
    {
        'folke/trouble.nvim',
        config = [[require('trouble').setup{}]],
        opts = { use_diagnostic_signs = true },
    },

    -- akinsho/flutter-tools.nvim config
    {
        {
            'akinsho/flutter-tools.nvim',
            lazy = false,
            dependencies = {
                'nvim-lua/plenary.nvim',
                'stevearc/dressing.nvim', -- optional for vim.ui.select
            },
        }
    },

    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' }
    },

    -- which-key.nvim config
    {
        'folke/which-key.nvim',
        config = [[
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup{}
    ]]
    },

    -- numToStr/Comment.nvim config
    {
        'numToStr/Comment.nvim',
        config = [[require('Comment').setup{}]],
    },

    -- nvim-treesitter config
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'bash',
                'html',
                'javascript',
                'json',
                'lua',
                'markdown',
                'python',
                -- add other required languages here
            }
        },
        {

        }
        -- Lua
        {
            "folke/zen-mode.nvim",
            opts   = {
            },
            config = function()
                require("zen-mode").setup({
                })
            end,
        }
    },
    { 'https://tpope.io/vim/fugitive.git' },
    { 'FabijanZulj/blame.nvim' },
})
})
