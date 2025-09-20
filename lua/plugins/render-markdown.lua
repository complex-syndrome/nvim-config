-- Markdown
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},

  -- Autocommand to always render markdown files
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        require('render-markdown').enable()
      end,
    })
  end,
}
