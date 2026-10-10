-- See `:help vim.keymap.set()`

-- i, a, v, <Esc>, /  => insert, append, visual, normal, command mode
-- h, j, k, l         => left, down, up, right
-- d, y, c            => Cut, Copy (yank), Change
-- w, b, e            => Next word, Previous beginning, Next end
-- diw / diW          => [D]elete [I]n [W]ord (Small, Big)
-- gcc                 => Comment
-- f{_} / F{_}        => Jump to next / previous _ character (Capital-sensitive)
-- t{_} / T{_}        => Similar to f{_} / F{_}, but -1 position
-- {, }               => Prev, Next paragraph
-- <C-o>, <C-i>       => Prev, Next visited paragraph
-- :wqa               => Write quit all files
-- g;                 => Last edited postition
-- "y+ (visual)       => Yank all to clipboard (if supported)

-- mODE: 'n' => normal, 'v' => visual, 'i' => insert
-- Default leader: \
-- <C-x> => Ctrl + X
-- <cmd> => Command mode
-- <CR>  => Carriage return (\r)

vim.keymap.set('n', '<F1>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<F1>', '<NOP>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select all text' })

-- Clear highlight on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- gt to switch between tabs
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprev<CR>')
vim.keymap.set('n', '<A-Left>', '<cmd>-tabmove<CR>')
vim.keymap.set('n', '<A-Right>', '<cmd>+tabmove<CR>')

-- Terminal
-- :tabnew and :terminal / :tab term for terminal mode (Same as plugins/toggleterm.lua)
vim.keymap.set('n', '<leader>tn', '<cmd>tab term<CR>', { desc = '[N]ew Tab [T]erminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- User commands
vim.api.nvim_create_user_command('DiagnosticInfo', function()
  for _, d in ipairs(vim.diagnostic.get(0)) do
    print(d.source, d.message)
  end
end, { desc = 'Show diagnostics for current buffer' })

--  Try it with `yap` in normal mode
--  See `:help lua-guide-autocommands` and `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }

    -- Hover documentation
    vim.keymap.set(
      'n',
      '<leader>kd',
      vim.lsp.buf.hover,
      vim.tbl_extend('force', opts, {
        desc = 'Hover Documentation',
      })
    )

    -- Signature help
    vim.keymap.set(
      { 'n', 'i' },
      '<leader>ke',
      vim.lsp.buf.signature_help,
      vim.tbl_extend('force', opts, {
        desc = 'Signature Help',
      })
    )
  end,
})
