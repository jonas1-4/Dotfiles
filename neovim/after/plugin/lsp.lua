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
local servers = { 'html', 'cssls', 'bashls', 'jsonls', 'intelephense', 'lua_ls', 'tsserver', 'angularls', 'dartls' }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Treesitter for better syntax highlighting
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
}

nvim_lsp.kotlin_language_server.setup{
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

-- Autopairs
require('nvim-autopairs').setup()
