return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		-- TODO: https://github.com/vuejs/language-tools/wiki/Neovim

		-----------
		-- Mason --
		-----------
		require("mason").setup()

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup()

		------------------
		-- Capabilities --
		------------------
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities()

		local on_attach = function(client, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. (desc or "") })
			end
			map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
			map("n", "gr", vim.lsp.buf.references, "References")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>fd", function()
				vim.diagnostic.open_float(nil, { focus = false })
			end, "Line Diagnostics")
		end

		local function get_tsdk()
			local local_ts = vim.fn.getcwd() .. "/node_modules/typescript/lib"
			if vim.fn.isdirectory(local_ts) == 1 then
				return local_ts
			end
			-- Mason fallback (works when typescript is installed via mason)
			local mason_ts = vim.fn.stdpath("data")
				.. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
			if vim.fn.isdirectory(mason_ts) == 1 then
				return mason_ts
			end
			return nil
		end

		-------------
		-- Servers --
		-------------
		local lspconfig = require("lspconfig")
		-- TODO
	end,
}
