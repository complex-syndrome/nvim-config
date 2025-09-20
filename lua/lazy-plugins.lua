-- :Lazy
-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
-- you can continue same window with `<space>sr` which resumes last telescope search

require('lazy').setup({
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Other plugins and alternatives?
-- https://github.com/tpope/vim-commentary
-- https://github.com/tpope/vim-unimpaired
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/folke/snacks.nvim
-- https://github.com/nvim-mini/mini.nvim?tab=readme-ov-file#installation
-- https://github.com/tpope/vim-fugitive
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
-- https://github.com/ThePrimeagen/init.lua
-- https://github.com/folke?tab=repositories&q=&type=&language=&sort=stargazers
-- https://github.com/neoclide/coc.nvim
-- https://github.com/epwalsh/obsidian.nvim
-- https://github.com/stevearc/oil.nvim
-- https://github.com/chentoast/marks.nvim
-- https://github.com/smjonas/inc-rename.nvim
-- https://github.com/nvim-neotest/neotest
-- https://github.com/rmagatti/auto-session
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/lukas-reineke/indent-blankline.nvim
-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/akinsho/toggleterm.nvim
