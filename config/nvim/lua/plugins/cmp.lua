return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
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
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<ESC>"] = cmp.mapping.close(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
			formatting = {
				format = function(_, vim_item)
					vim_item.abbr = vim_item.abbr:sub(1, 25) .. " "
					vim_item.kind = vim_item.kind:sub(1, 1)
					vim_item.menu = nil
					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered({ border = "single" }),
				documentation = cmp.config.window.bordered({ border = "single" }),
			},
		}
	end
}
