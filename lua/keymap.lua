-- See `:help vim.keymap.set()`

-- i, a, v, <Esc>, /  => insert, append, visual, normal, command mode
-- h, j, k, l         => left, down, up, right
-- d, y, c            => Cut, Copy (yank), Change
-- w, b, e            => Next word, Previous beginning, Next end
-- diw / diW          => [D]elete [I]n [W]ord (Small, Big)
-- gc / gcc           => Comment
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

-- Clear highlight on <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- :tabnew and :terminal / :tab term for terminal mode (Same as plugins/toggleterm.lua)
-- gt to switch between tabs
-- vim.keymap.set('n', '<leader>tn', '<cmd>tab term<CR>', { desc = '[N]ew Tab [T]erminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Current warnings and errors
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  Try it with `yap` in normal mode
--  See `:help lua-guide-autocommands` and `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
