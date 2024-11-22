-- ~/.config/nvim/init.lua

-- LSP config
--
local nvim_lsp = require('lspconfig')

-- -- Autocompletion
local lsp_defaults = nvim_lsp.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local on_attach = function(client, _)
    -- Navigate to the definition of the symbol under the cursor
    if client.name == 'ts_ls' then
        client.resolved_capabilities.document_formatting = false
    end
end

-- Use a loop to conveniently setup multiple servers
local servers = {'kotlin_language_server', 'eslint', 'html', 'cssls', 'bashls', 'jsonls', 'intelephense', 'lua_ls', 'angularls', 'rust_analyzer'}


-- 'dartls'
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach , capabilities = capabilities}
end

-- Treesitter for better syntax highlighting
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

nvim_lsp.ts_ls.setup {
    init_options = {
        preferences = {
            -- other preferences...
            importModuleSpecifierPreference = 'relative',
            importModuleSpecifierEnding = 'minimal',
        },
    },
    on_attach = on_attach,
}


-- Move to the previous error/warning
vim.keymap.set('n', '<leader>c[', function() vim.lsp.diagnostic.goto_prev() end,
    { noremap = true, silent = true, desc = 'Prev Diagnostic' })

vim.keymap.set('n', '<leader>cd', function() vim.lsp.buf.definition() end,
    { noremap = true, silent = true, desc = 'Go To Definition' })
vim.keymap.set('n', 'gd', function() vim.lsp.buf.implementation() end,
    { noremap = true, silent = true, desc = 'Go To Definition' })

-- Find references of the symbol under the cursor
vim.keymap.set('n', '<leader>cD', function() vim.lsp.buf.references() end,
    { noremap = true, silent = true, desc = 'Find References' })
vim.keymap.set('n', 'gD', function() vim.lsp.buf.references() end,
    { noremap = true, silent = true, desc = 'Find References' })

-- Rename the symbol under the cursor
vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end,
    { noremap = true, silent = true, desc = 'Rename Symbol' })

-- Show hover information of the symbol under the cursor
vim.keymap.set('n', '<leader>ch', function() vim.lsp.buf.hover() end,
    { noremap = true, silent = true, desc = 'Show Hover' })

-- Signature help
vim.keymap.set('n', '<leader>cs', function() vim.lsp.buf.signature_help() end,
    { noremap = true, silent = true, desc = 'Signature Help' })

-- Find and list symbols in the current document
vim.keymap.set('n', '<leader>cl', function() vim.lsp.buf.document_symbol() end,
    { noremap = true, silent = true, desc = 'List Document Symbols' })

-- Find and list symbols in the current workspace
vim.keymap.set('n', '<leader>cL', function() vim.lsp.buf.workspace_symbol() end,
    { noremap = true, silent = true, desc = 'List Workspace Symbols' })

-- Show and fix code actions (refactor, fix imports, etc.)
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end,
    { noremap = true, silent = true, desc = 'Code Action' })

-- Show errors and warnings in the current line
vim.keymap.set('n', '<leader>ce', function() vim.lsp.diagnostic.show_line_diagnostics() end,
    { noremap = true, silent = true, desc = 'Line Diagnostics' })

-- Move to the next error/warning
vim.keymap.set('n', '<leader>c]', function() vim.lsp.diagnostic.goto_next() end,
    { noremap = true, silent = true, desc = 'Next Diagnostic' })

-- Move to the previous error/warning
vim.keymap.set('n', '<leader>c[', function() vim.lsp.diagnostic.goto_prev() end,
    { noremap = true, silent = true, desc = 'Prev Diagnostic' })

-- Format the current file
vim.keymap.set('n', '<leader>cf', function()
    vim.lsp.buf.format()
    if vim.bo.filetype == 'ts' then
        vim.defer_fn(function()
            vim.cmd('EslintFixAll')
        end, 500) -- Warte 500 Millisekunden
    end
end, { noremap = true, silent = true, desc = 'Format File' })

-- Autopairs
require('nvim-autopairs').setup()
