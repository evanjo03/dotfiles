return {
  "David-Kunz/jester",
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>jf", "<cmd>lua require('jester').run()<cr>", { desc = "Run current jest file" })
  end,
}
