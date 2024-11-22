require("lazy").setup({
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
            }
        },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-pack/nvim-spectre' }, -- morhetz/gruvbox config
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
        {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require("colorizer").setup()
            end
        },
        -- Core plugins
        { 'zbirenbaum/copilot.lua' },
        {
            "FabijanZulj/blame.nvim",
            config = function()
                require("blame").setup()
            end
        },
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

        -- snippets + autocomplete
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },

        -- command completion
        { 'smolck/command-completion.nvim' },

        -- Other plugins
        { 'MunifTanjim/prettier.nvim' },
        { 'Pocco81/auto-save.nvim' },
        { 'theprimeagen/harpoon' },
        { 'TimUntersberger/neogit',          dependencies = 'nvim-lua/plenary.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'glepnir/lspsaga.nvim' },
        { 'kabouzeid/nvim-lspinstall' },
        { 'windwp/nvim-autopairs' },
        { 'mfussenegger/nvim-dap' },
        { 'mfussenegger/nvim-dap-ui',        dependencies = 'mfussenegger/nvim-dap',                                         "nvim-neotest/nvim-nio" },
        { 'andymass/vim-matchup',            opts = function() vim.g.matchup_matchparen_offscreen = { method = 'popup' } end },
        { 'Dhanus3133/LeetBuddy.nvim',       dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' } },
        {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-tree.lua",
            },
            config = function()
                require("lsp-file-operations").setup()
            end,
        },


        -- folke/trouble.nvim config
        {
            'folke/trouble.nvim',
            config = [[require('trouble').setup{}]],
            opts = {
                use_diagnostic_signs = true,
                keys = {
                    ["<cr>"] =
                    "jump_close",
                    j = "next",
                    k = "prev",
                },
            },
        },
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
            ---@module 'render-markdown'
            ---@type render.md.UserConfig
            opts = {},
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
        },
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
    { 'https://tpope.io/vim/fugitive.git' }
)
