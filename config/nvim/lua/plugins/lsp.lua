return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim" },
	config = function()
		local opts = {
			capabilities = require('blink.cmp').get_lsp_capabilities(),
			on_attach = function ()
				vim.keymap.set("n", "gr", [[<CMD>FzfLua lsp_references resume=true header=false<CR>]])
				vim.keymap.set("n", "wd", [[<CMD>FzfLua lsp_workspace_diagnostics resume=true header=false<CR>]])
				vim.keymap.set("n", "ws", [[<CMD>FzfLua lsp_workspace_symbols resume=true header=false<CR>]])
				vim.keymap.set("n", "ca", [[<CMD>FzfLua lsp_code_actions resume=true header=false<CR>]])
				vim.keymap.set("n", "gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
				vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
			end
		}
		require("mason").setup { ui = { border = "single" } }
		require("mason-lspconfig").setup {
			ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
			automatic_installation = true,
		}
		require("mason-lspconfig").setup_handlers {
			function(server) require("lspconfig")[server].setup(opts) end
		}
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	end
}
