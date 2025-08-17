return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		-- Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "vue_ls", "vtsls", "eslint", "emmet_language_server" },
		})

		-- Capabilities
		local caps = require("blink.cmp").get_lsp_capabilities()

		-- on_attach
		local on_attach = function(client, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. (desc or "") })
			end
			map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
			map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
			map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
			map("n", "go", vim.lsp.buf.type_definition, "Goto Type Definition")
			map("n", "gr", vim.lsp.buf.references, "References")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>fd", function()
				vim.diagnostic.open_float(nil, { focus = false })
			end, "Line Diagnostics")
			map({ "n", "x" }, "<leader>ff", function()
				vim.lsp.buf.format({ async = true })
			end, "Format")

			if vim.lsp.inlay_hint then
				pcall(vim.lsp.inlay_hint, bufnr, true)
			end
		end

		-- Diagnostics
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		-- Resolve @vue/typescript-plugin path
		local function vue_ts_plugin_path()
			local uv = vim.uv or vim.loop
			local cwd = vim.fn.getcwd()
			local local_path = cwd .. "/node_modules/@vue/language-server"
			local stat = uv.fs_stat(local_path)
			if stat and stat.type == "directory" then
				return local_path
			end
			local mason_path = vim.fn.expand("$MASON/packages")
				.. "/vue-language-server"
				.. "/node_modules/@vue/language-server"

			if uv.fs_stat(mason_path) then
				return mason_path
			end

			-- Fallback: global npm root
			local npm_root = vim.fn.trim(vim.fn.system({ "npm", "root", "-g" }))
			local global_path = npm_root .. "/@vue/language-server"
			if uv.fs_stat(global_path) then
				return global_path
			end

			print("No plugin path found for Vue")
			return nil
		end

		local ts_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_ts_plugin_path(),
			languages = { "vue" },
			configNamespace = "typescript",
		}

		-- vtsls (preferred TS backend)
		vim.lsp.config("vtsls", {
			capabilities = caps,
			on_attach = on_attach,
			filetypes = ts_filetypes,
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = { vue_plugin },
						-- Optional: often better results with single server
						useSyntaxServer = "never",
					},
					experimental = {
						completion = { enableServerSideFuzzyMatch = true },
					},
				},
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "all" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
					-- Point to local TS if available
					tsdk = (function()
						local p = vim.fn.getcwd() .. "/node_modules/typescript/lib"
						return vim.fn.isdirectory(p) == 1 and p or nil
					end)(),
				},
				javascript = {
					inlayHints = {
						parameterNames = { enabled = "all" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
				},
			},
		})

		-- vue-language-server (Volar)
		vim.lsp.config("vue_ls", {
			capabilities = caps,
			on_attach = on_attach,
			-- Forward Volar’s TS requests to vtsls
			on_init = function(client)
				client.handlers["tsserver/request"] = function(_, result, context)
					local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
					local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
					local clients = {}

					vim.list_extend(clients, ts_clients)
					vim.list_extend(clients, vtsls_clients)

					if #clients == 0 then
						vim.notify(
							"Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
							vim.log.levels.ERROR
						)
						return
					end
					local ts_client = clients[1]

					local param = unpack(result)
					local id, command, payload = unpack(param)
					ts_client:exec_cmd({
						title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
						command = "typescript.tsserverRequest",
						arguments = {
							command,
							payload,
						},
					}, { bufnr = context.bufnr }, function(_, r)
						local response = r and r.body
						-- TODO: handle error or response nil here, e.g. logging
						-- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
						local response_data = { { id, response } }

						---@diagnostic disable-next-line: param-type-mismatch
						client:notify("tsserver/response", response_data)
					end)
				end
			end,
		})

		-- Enable the chosen pair
		vim.lsp.enable({ "vtsls", "vue_ls" })
	end,
}
