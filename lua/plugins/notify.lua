-- Notify

return {
  'rcarriga/nvim-notify',
  lazy = true,

  -- tells lazy.nvim to load it whenever you `require("notify")`
  module = 'notify',

  config = function()
    require('notify').setup {
      merge_duplicates = false,
      render = 'wrapped-default',
    }
  end,
}
