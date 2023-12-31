return {
  -- { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  -- { "Mofiqul/vscode.nvim", name = "vscode", lazy = false, priority = 1000 },
  -- {
  --   "oxfist/night-owl.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
    },
  },
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       -- Style to be applied to different syntax groups
  --       -- Value is any valid attr-list value for `:help nvim_set_hl`
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = {},
  --       -- Background styles. Can be "dark", "transparent" or "normal"
  --       sidebars = "transparent", -- style for sidebars, see below
  --       floats = "transparent", -- style for floating windows
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "vscode",
      -- colorscheme = "night-owl",
      colorscheme = "tokyonight-night",
      -- colorscheme = "solarized-osaka",
    },
  },
}
