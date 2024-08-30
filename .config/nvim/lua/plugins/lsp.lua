return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		local servers = { "clangd", "rust_analyzer", "lua_ls" }
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("mason").setup {
			ui = {
				icons = {
					package_installed = "I",
					package_pending = "P",
					package_uninstalled = "X",
				},
				border = "rounded",
				width = 0.8,
				height = 0.8,
			},
		}
		mason_lspconfig.setup {
			ensure_installed = servers,
			automatic_installation = true,
		}
		mason_lspconfig.setup_handlers {
			function(server)
				local ok, _ = pcall(require, "servers." .. server)
				if not ok then
					lspconfig[server].setup{
						capabilities = capabilities,
					}
				end
			end,
		}
	end
}
