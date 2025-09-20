-- Linting
local vars = require 'code-env'

return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = vars.linters_by_ft
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })

      -- Create :Lint command
      vim.api.nvim_create_user_command('Lint', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current buffer' })

      -- Create :LintInfo command
      vim.api.nvim_create_user_command('LintInfo', function()
        local filetype = vim.bo.filetype
        local linters = lint.linters_by_ft[filetype] or {}
        print('Filetype:', filetype)
        print('Linters:', vim.inspect(linters))
      end, { desc = 'Show lint configuration for current filetype' })
    end,
  },
}
