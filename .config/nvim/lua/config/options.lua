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
opt.tabstop = 4 -- A TAB character looks like 4 spaces
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
opt.shiftwidth = 4 -- Number of spaces inserted when indenting
