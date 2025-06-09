local opt = vim.opt

-- Show line numbers default
opt.number = true
opt.relativenumber = true

-- Use system clipboard; schedule to reduce startup time
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Show which line your cursor is on
opt.cursorline = true

opt.confirm = true

-- Tab sizes
local tab_size = 2
opt.tabstop = tab_size -- A TAB character looks like 4 spaces
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
opt.softtabstop = tab_size -- Number of spaces inserted instead of a TAB character
opt.shiftwidth = tab_size -- Number of spaces inserted when indenting

-- smooth scroll
opt.smoothscroll = true

-- Disable swap files
opt.swapfile = false
