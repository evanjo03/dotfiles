require 'evanjo03.config.global'
require 'evanjo03.config.options'
require 'evanjo03.config.keymaps'
require 'evanjo03.config.autocommands'

-- Install Lazy
require 'evanjo03.config.lazy'

-- Plugins
---@diagnostic disable-next-line: different-requires
require('lazy').setup({
  { import = 'evanjo03.plugins' },
  { import = 'evanjo03.lsp' },
  change_detection = false,
  checker = {
    enabled = true,
    notify = false,
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Colorscheme
vim.cmd 'colorscheme kanagawa'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
