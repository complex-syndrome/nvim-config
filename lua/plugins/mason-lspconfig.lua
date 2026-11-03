return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = {}, -- already handled by mason-tool-installer
    automatic_installation = false,
    automatic_enable = true,
  },
}
