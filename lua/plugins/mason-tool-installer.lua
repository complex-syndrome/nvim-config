local vars = require 'code-env'

return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'mason-org/mason.nvim',
  },
  opts = {
    ensure_installed = vars.ensure_installed, -- All required packages are at code-env.lua
    auto_update = false,
    run_on_start = true,
  },
}
