return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local icons = require('config.icons').lualine
		require('lualine').setup {
			options = {
				component_separators = icons.component_separators,
				section_separators = icons.section_separators,
				disabled_filetypes = { 'statusline', 'winbar', 'NvimTree' },
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'diagnostics'},
				lualine_c = {{
					'buffers',
					symbols = icons.symbols
				}},
				lualine_x = {},
				lualine_y = {'filetype'},
				lualine_z = {'location'}
			},
		}
	end
}
