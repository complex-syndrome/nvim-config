-- uv integration with neovim

return {
  'benomahony/uv.nvim',
  ft = { 'python' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    keymaps = {
      prefix = '<leader>cu',
    },
  },
}
