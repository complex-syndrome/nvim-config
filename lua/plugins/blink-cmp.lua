-- Autocompletion

return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim',
    'L3MON4D3/LuaSnip',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- K, <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help

      -- Accept completion via: 'default', 'super-tab', 'enter', 'none'
      -- :help ins-completion and :h blink-cmp-config-keymap
      preset = 'super-tab',

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
      nerd_font_variant = 'mono', -- Or 'normal', check your font
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },

    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    signature = { enabled = true },
  },
}
