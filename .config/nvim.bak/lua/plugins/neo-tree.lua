return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    default_component_configs = {
      indent = {
        expander_collapsed = "▶",
        expander_expanded = "▼",
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
