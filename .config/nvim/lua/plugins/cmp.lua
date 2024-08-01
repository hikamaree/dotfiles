return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
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
				format = function(_, item)
					item.abbr = string.sub(item.abbr, 1, 25)
					return item
				end
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
		}
	end
}
