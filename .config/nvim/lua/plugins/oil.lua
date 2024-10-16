return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      mode = "n",
      "-",
      "<cmd>Oil<CR>",
      desc = "Open the Oil file viewer",
    },
  },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
