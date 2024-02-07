return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'williamboman/mason.nvim',
	},
	config = function()
		local servers = { 'clangd', 'rust_analyzer', 'lua_ls' }
		local lspconfig = require('lspconfig')
		local mason_lspconfig = require('mason-lspconfig')
		require('mason').setup {
			ui = {
				icons = require('config.icons').mason
			},
		}
		mason_lspconfig.setup {
			ensure_installed = servers,
			automatic_installation = true,
		}
		mason_lspconfig.setup_handlers {
			function(server)
				local ok, _ = pcall(require, 'servers.' .. server)
				if not ok then
					lspconfig[server].setup{}
				end
			end,
		}
	end
}
