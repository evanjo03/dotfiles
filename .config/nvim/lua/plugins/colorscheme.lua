-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			transparent_background = true,
-- 			flavour = "frappe", -- latte, frappe, macchiato, mocha
-- 		})
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
return {
	"Mofiqul/vscode.nvim",
	name = "vscode",
	priority = 1000,
	config = function()
		require("vscode").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("vscode")
	end,
}
