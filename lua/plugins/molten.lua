return {
  'benlubas/molten-nvim',
  version = '^1.0.0',
  build = ':UpdateRemotePlugins',
  init = function()
    vim.g.molten_image_provider = 'image.nvim'

    vim.keymap.set('n', '<leader>ji', ':MoltenInit<CR>', { silent = true, desc = 'Initialize the plugin' })
    vim.keymap.set('n', '<leader>je', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'Run operator selection' })
    vim.keymap.set('n', '<leader>jrl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'Evaluate line' })
    vim.keymap.set('n', '<leader>jrr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 'Re-evaluate cell' })
    vim.keymap.set('v', '<leader>jr', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'Evaluate visual selection' })
    vim.keymap.set('n', '<leader>jrd', ':MoltenDelete<CR>', { silent = true, desc = 'Delete cell' })
    vim.keymap.set('n', '<leader>joh', ':MoltenHideOutput<CR>', { silent = true, desc = 'hide output' })
    vim.keymap.set('n', '<leader>joe', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = 'show/enter output' })
  end,
}
