local vars = require 'code-env'
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})
for name, cfg in pairs(vars.servers) do
  vim.lsp.config(name, cfg)
end

vim.lsp.enable(vim.tbl_keys(vars.servers))
