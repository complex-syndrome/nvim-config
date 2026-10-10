-- Display key on screen

-- Create a statefile to persist screen keys between sessions
-- NOTE: Use :ToggleScreenkey instead if possible, :Screenkey only ensures that one session it is OFF / ON
local statefile = vim.fn.stdpath 'state' .. '/screenkey'

vim.api.nvim_create_autocmd('VimEnter', { -- All done starting up and entering vim
  callback = function()
    if vim.fn.filereadable(statefile) == 1 then
      -- [1] is the first line (lua is not zero indexed)
      if vim.fn.readfile(statefile)[1] == 'ON' then
        vim.cmd 'Screenkey'
      end
    end
  end,
})

vim.api.nvim_create_user_command('ToggleScreenkey', function()
  if require('screenkey').is_active() then
    vim.fn.writefile({ 'OFF' }, statefile)
  else
    vim.fn.writefile({ 'ON' }, statefile)
  end
  vim.cmd 'Screenkey'
end, {})

return {
  'NStefan002/screenkey.nvim',
  lazy = false,
  version = '*', -- or branch = "main", to use the latest commit
  opts = {
    win_opts = {
      width = 25,
    },
  },
  vim.keymap.set('n', '<leader>ks', '<cmd>ToggleScreenkey<CR>', { desc = 'Toggle [S]creen [K]ey' }),
}
