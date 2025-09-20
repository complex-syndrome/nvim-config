local vars = require 'code-env'

return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = {}, -- already handled by mason-tool-installer
    automatic_installation = false,
    handlers = {
      function(server_name)
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local server = vars.servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  },
}
