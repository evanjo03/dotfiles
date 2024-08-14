-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
local global = vim.g

global.mapleader = ' '
global.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
global.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
