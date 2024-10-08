-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 5
  end,
  opts = {
    spec = {
      mode = { 'n', 'v' },
      { '<leader>g', group = 'Git' },
      { '<leader>d', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>s', group = 'Splits' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>t', group = 'Tabs' },
      { '<leader>h', group = 'Git Hunk' },
    },
  },
  -- keys = {
  --     {
  --         "<leader>?",
  --         function()
  --             require("which-key").show({ global = false })
  --         end,
  --         desc = "Buffer Local Keymaps (which-key)",
  --     },
  -- },
}
