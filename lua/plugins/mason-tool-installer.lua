local vars = require 'code-env'

return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  opts = {
    ensure_installed = vars.ensure_installed, -- All required packages are at code-env.lua
    auto_update = true,
    run_on_start = true,
  },
}
