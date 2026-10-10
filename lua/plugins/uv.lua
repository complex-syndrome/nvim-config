-- uv integration with neovim

return {
  'benomahony/uv.nvim',
  ft = { 'python' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
	config = function()
    require('uv').setup()
  end,
  opts = {
    keymaps = {
			picker_integration = true,
    },
  },
}
