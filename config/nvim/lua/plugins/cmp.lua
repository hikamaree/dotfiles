return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		cmp.setup {
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			mapping = {
				['<CR>'] = cmp.mapping.confirm { select = true },
				['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
				["<ESC>"] = cmp.mapping.close(),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'buffer' },
			},
			formatting = {
				format = function(_, item)
					item.abbr = string.sub(item.abbr, 1, 25)
					return item
				end
			}
		}
	end
}
