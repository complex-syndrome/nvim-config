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

      lint.linters.shuck = {
        cmd = 'shuck',
        stdin = false,
        args = { 'check' },
        stream = 'stderr',
        ignore_exitcode = true,
        parser = require('lint.parser').from_errorformat('%f:%l:%c %m', {
          source = 'shuck',
          severity = vim.diagnostic.severity.WARN,
        }),
      }

      lint.linters.taplo = {
        cmd = 'taplo',
        stdin = false,
        args = { 'check' },
        stream = 'stderr',
        ignore_exitcode = true,
        parser = require('lint.parser').from_errorformat('%f:%l:%c %m', {
          source = 'taplo',
          severity = vim.diagnostic.severity.WARN,
        }),
      }

      lint.linters.markdownlint.args = {
        '--disable',
        'MD013',
        '--', -- Required separator
      }

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
