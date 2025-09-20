return {
  'Weissle/persistent-breakpoints.nvim',
  config = function()
    require('persistent-breakpoints').setup {
      load_breakpoints_event = { 'BufReadPost' },
    }
    vim.keymap.set('n', '<leader>b', require('persistent-breakpoints.api').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', require('persistent-breakpoints.api').clear_all_breakpoints, { desc = 'Debug: Clear Breakpoints' })
  end,
}
