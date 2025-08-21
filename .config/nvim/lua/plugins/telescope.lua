return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search Grep" },
	},
}
