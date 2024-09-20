return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "~/code/obsidian/Home",
      },
      {
        name = "Work",
        path = "~/code/obsidian/Work",
      },
    },
  },
}
