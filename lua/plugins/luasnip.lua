-- For blink.cmp, lazy.nvim will handle import order automatically

return {
  'L3MON4D3/LuaSnip',
  version = '2.*',
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      -- For windows could not build for regex
      return
    end
    return 'make install_jsregexp'
  end)(),
  dependencies = {
    { -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  opts = {},
}
