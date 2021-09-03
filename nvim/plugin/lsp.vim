""lua <<EOF
""local nvim_lsp = require'nvim_lsp'
""
""local lsp_on_attach = function(client)
""  print("LSP started.")
""
""  -- Mappings
""  local opts = {noremap = true, silent = true}
""  vim.fn.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
""  vim.fn.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
""end
""
""-- The Language Servers
""nvim_lsp.dartls.setup {
""  on_attach = lsp_on_attach
""}
""
""nvim_lsp.tsserver.setup {
""  on_attach = lsp_on_attach
""}
""
""vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
""
""local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
""dart_capabilities.textDocument.codeAction = {
""  dynamicRegistration = false;
""      codeActionLiteralSupport = {
""          codeActionKind = {
""              valueSet = {
""                 "",
""                 "quickfix",
""                 "refactor",
""                 "refactor.extract",
""                 "refactor.inline",
""                 "refactor.rewrite",
""                 "source",
""                 "source.organizeImports",
""              };
""          };
""      };
""}
""nvim_lsp.dartls.setup({
""  on_attach = dart_attach;
""  init_options = {
""    onlyAnalyzeProjectsWithOpenFiles = true,
""    suggestFromUnimportedLibraries = false,
""    closingLabels = true,
""  };
""  capabilities = dart_capabilities;
""})
""EOF
