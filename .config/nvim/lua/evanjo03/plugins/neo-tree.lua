-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  enabled = false,
  cmd = 'Neotree',
  deactivate = function()
    -- stolen from lazy
    vim.cmd [[Neotree close]]
  end,
  init = function()
    -- autocmd stolen from lazy
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
      desc = 'Start Neo-tree with directory',
      once = true,
      callback = function()
        if package.loaded['neo-tree'] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == 'directory' then
            require 'neo-tree'
          end
        end
      end,
    })
  end,
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --                                  -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      hijack_netrw_behavior = 'open_current',
      -- "open_default", -- netrw disabled, opening a directory opens neo-tree
      -- in whatever position is specified in window.position
      -- "open_current", -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
        hide_by_name = {
          '.DS_Store',
          'thumbs.db',
          --"node_modules",
        },
        hide_by_pattern = {
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db",
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  },
}
