-- Specific Comment Highlights
-- NOTE: Some colors we have, try out `:TodoTelescope`!
-- TODO: Should have none in this file
-- PERF: Without any todos, except for line above, PERFECT
-- BUG:  None Found
-- FIX:  Same as above
-- HACK: Some magic
-- WARNING: Line too long?

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = vim.g.have_nerd_font },
}
