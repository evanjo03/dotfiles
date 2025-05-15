local opt = vim.opt

-- Show line numbers default
opt.number = true
opt.relativenumber = true

-- Use system clipboard; schedule to reduce startup time
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Show which line your cursor is on
vim.o.cursorline = true

vim.o.confirm = true
