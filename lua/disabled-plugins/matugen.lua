 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1e1a23',
    base01 = '#312b3b',
    base02 = '#2c2636',
    base03 = '#6c6378',
    base04 = '#b2afb6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#7f86b3',
    base0A = '#c6a2c9',
    base0B = '#b29fcc',
    base0C = '#afb3d0',
    base0D = '#bcacd3',
    base0E = '#ceaed0',
    base0F = '#e2cde4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1e1a23' })
  hi('TelescopeBorder',         { fg = '#6c6378',             bg = '#1e1a23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1e1a23' })
  hi('TelescopePromptBorder',   { fg = '#6c6378',             bg = '#1e1a23' })
  hi('TelescopePromptPrefix',   { fg = '#b29fcc',             bg = '#1e1a23' })
  hi('TelescopePromptCounter',  { fg = '#b2afb6',  bg = '#1e1a23' })
  hi('TelescopePromptTitle',    { fg = '#1e1a23',             bg = '#b29fcc' })
  hi('TelescopePreviewTitle',   { fg = '#1e1a23',             bg = '#c6a2c9' })
  hi('TelescopeResultsTitle',   { fg = '#1e1a23',             bg = '#7f86b3' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#2c2636' })
  hi('TelescopeSelectionCaret', { fg = '#b29fcc',             bg = '#2c2636' })
  hi('TelescopeMatching',       { fg = '#b29fcc',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
