-- https://learnxinyminutes.com/docs/lua/
-- :help lua-guide
-- https://neovim.io/doc/user/lua-guide.html
-- "<space>sh" to [s]earch the [h]elp documentation
-- :checkhealth

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'
require 'keymap'
require 'lazy-manager'
require 'lazy-plugins'
