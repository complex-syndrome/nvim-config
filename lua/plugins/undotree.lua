-- Advanced undo

return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle, { desc = 'Undo Tree' })
  end,
}
