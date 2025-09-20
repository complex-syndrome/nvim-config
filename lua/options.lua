-- :help option-list
-- :help lua-options
-- :help lua-options-guide

vim.o.number = true
-- vim.o.relativenumber = true

vim.opt.shiftwidth = 2 -- Number of spaces to use for autoindent
vim.opt.tabstop = 2 -- Number of visual spaces per TAB
-- vim.opt.expandtab = true -- Expand TABs to spaces

vim.o.mouse = 'a' -- All modes available to use mouse
vim.o.showmode = false -- Already in the status line

vim.o.breakindent = true -- When line is too long, \n and indent
vim.o.undofile = true -- Persist undo across sessions

vim.o.ignorecase = true -- Case-insensitive searching...
vim.o.smartcase = true -- UNLESS \C or one or more capital letters in the search term

vim.o.signcolumn = 'yes' -- Line and char position

vim.o.updatetime = 250 -- Autosave (ms)
vim.o.timeoutlen = 300 -- Multichar keymaps wait time, not recommended to make it faster
-- https://github.com/liuchengxu/vim-which-key/issues/35 (An example)

-- New windows
vim.o.splitright = true
vim.o.splitbelow = true

-- :help 'list'
-- :help 'listchars'
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- :help 'confirm'
vim.o.confirm = true

-- Syncs keyboard. See `:help 'clipboard'`.
-- Setted after `UiEnter` to increase startup-time
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- When creating a session file to save session (For plugins/auto-session.lua)
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Substitute many files at one go
vim.o.inccommand = 'nosplit'
