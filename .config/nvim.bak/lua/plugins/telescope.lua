local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "truncate " },
      -- mappings = {
      --   i = {
      --     ["<C-k>"] = actions.move_selection_previous, -- move to prev result
      --     ["<C-j>"] = actions.move_selection_next, -- move to next resultF,
      --     ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      --   },
      -- },
    },
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
