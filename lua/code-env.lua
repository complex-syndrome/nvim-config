local M = {}

-- Refer :Mason for available downloads
-- Remember to also set it up in other variables
M.ensure_installed = {
  -- Lua
  'lua-language-server',
  'stylua',

  -- Markdown
  'markdownlint',

  -- Json
  -- 'jsonls',
  -- 'jsonlint',
  -- 'jq',

  -- Python
  -- 'ruff',
  -- 'pyright',
  -- 'debugpy',

  -- Rust
  -- 'rust_analyzer',
  -- 'codelldb',

  -- Golang
  -- 'gopls',
  -- 'goimports',
  -- 'delve',

  -- JS
  -- 'prettierd',
}

M.servers = {
  --  Add any additional override configuration in the following tables. Available keys are:
  --  - cmd (table): Override the default command used to start the server
  --  - filetypes (table): Override the default list of associated filetypes for the server
  --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
  --  - settings (table): Override the default settings passed when initializing the server.
  --  For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  -- jsonls = {},

  -- pyright = {},
  -- rust_analyzer = {},
  -- gopls = {},

  -- ts_ls = {},
  -- clangd = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  -- Some languages (like typescript) have entire language plugins that can be useful:
  -- https://github.com/pmizio/typescript-tools.nvim
}

M.formatters_by_ft = {
  -- Default applies formatter sequentially
  -- 'stop_after_first' runs the first available formatter from the list only
  -- If not mentioned, install using M.ensure_installed
  lua = { 'stylua' },
  markdown = { 'markdownlint' },
  -- json = { 'jq' },

  -- python = { 'ruff_format' }, --'isort', 'black', stop_after_first = true },
  -- rust = { 'rustfmt' }, -- bundled with rust install
  -- go = { 'goimports' },

  -- javascript = { 'prettierd' }, --'prettier', stop_after_first = true },
}

M.linters_by_ft = {
  markdown = { 'markdownlint' },
  -- json = { 'jsonlint' },

  -- python = { 'ruff' },
  -- rust = { 'clippy' }, -- bundled with rust install
  -- go = {},

  -- yaml = { "yamllint" },
  -- clojure = { 'clj-kondo' },
  -- dockerfile = { 'hadolint' },
  -- inko = { 'inko' },
  -- janet = { 'janet' },
  -- rst = { 'vale' },
  -- ruby = { 'ruby' },
  -- terraform = { 'tflint' },
  -- text = { 'vale' }
}

return M
