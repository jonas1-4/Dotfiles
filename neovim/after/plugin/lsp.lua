-- ~/.config/nvim/init.lua

-- LSP config
--
local nvim_lsp = require('lspconfig')

nvim_lsp.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

local on_attach = function(client, bufnr)
    -- Navigate to the definition of the symbol under the cursor
    if client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
    end
end

-- Use a loop to conveniently setup multiple servers
local servers = { 'html', 'cssls', 'bashls', 'jsonls', 'intelephense', 'lua_ls', 'tsserver', 'angularls',  }
'dartls'
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Treesitter for better syntax highlighting
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

nvim_lsp.kotlin_language_server.setup {
    on_attach = on_attach,
}

-- Autocompletion
require('compe').setup {
    enabled = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
        treesitter = true,
    }
}

-- Use Tab for autocompletion
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })

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
    if vim.bo.filetype == 'dart' then
        -- vim.fn['dart#Format']()
        vim.lsp.buf.format()
    else
        vim.lsp.buf.format()
    end
end, { noremap = true, silent = true, desc = 'Format File' })

-- Autopairs
require('nvim-autopairs').setup()
