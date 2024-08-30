return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim"
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm { select = true },
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<ESC>"] = cmp.mapping.close(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
			formatting = {
				format = require("lspkind").cmp_format {
					mode = 'symbol',
					maxwidth = 25,
					before = function(_, vim_item)
						if vim_item.menu ~= nil and string.len(vim_item.menu) > 0 then
							vim_item.menu = string.sub(vim_item.menu, 1, 0) .. ""
						end
						return vim_item
					end,
				}
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
		}
	end
}
