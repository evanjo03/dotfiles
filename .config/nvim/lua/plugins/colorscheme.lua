return {
  { "Mofiqul/vscode.nvim", name = "vscode", lazy = false, priority = 1000 },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = false, priority = 1000 },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    name = "tokyonight",
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
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    name = "kanagawa",
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    name = "onedark",
  },
  {
    "rockyzhang24/arctic.nvim",
    name = "arctic",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    branch = "main",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      -- colorscheme = "nightfly",
      -- colorscheme = "vscode",
      -- colorscheme = "nightfox",
      -- colorscheme = "kanagawa",
      -- colorscheme = "arctic",
      colorscheme = "catppuccin",
      -- colorscheme = "night-owl",
      -- colorscheme = "tokyonight",
      -- colorscheme = "solarized-osaka",
    },
  },
}
