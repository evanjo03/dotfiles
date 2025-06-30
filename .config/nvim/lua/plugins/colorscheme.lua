return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavour = "frappe" } },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   name = "vscode",
  --   priority = 1000,
  -- },
  -- { "shaunsingh/nord.nvim", name = "nord", priority = 1000 },

  -- Configure LazyVim to load catpuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
