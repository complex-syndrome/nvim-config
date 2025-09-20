-- New UI
-- https://github.com/folke/noice.nvim

return {
  -- Recommended to use nvim nightly
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    -- Something like this:
    -- {
    --   'rcarriga/nvim-notify',
    --   lazy = true,
    --   module = 'notify', -- tells lazy.nvim to load it whenever you `require("notify")`
    -- }
    -- OPTIONAL:
    -- `nvim-notify` is only needed, if you want to use the notification view.
    -- If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }
  end,
}
