-- Autoformatting
local vars = require 'code-env'

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ile for[M]at',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if not disable_filetypes[vim.bo[bufnr].filetype] then
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,

    formatters_by_ft = vars.formatters_by_ft,
  },
}
