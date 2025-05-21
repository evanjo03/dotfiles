-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 	require("catppuccin").setup({
-- 		flavour = "frappe", -- latte, frappe, macchiato, mocha
-- 	})
-- 	vim.cmd.colorscheme("catppuccin")
-- 	end
-- }
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	name = "kanagawa",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("kanagawa")
-- 	end
-- }
-- return {
-- 	"rockyzhang24/arctic.nvim",
-- 	branch = "v2",
-- 	dependencies = { "rktjmp/lush.nvim" },
-- 	name = "arctic",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("arctic")
-- 	end,
-- }
return {
	"EdenEast/nightfox.nvim",
	name = "nightfox",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nordfox")
	end,
}
