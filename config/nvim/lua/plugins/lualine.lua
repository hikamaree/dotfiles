return {
	'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup {
			options = {
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = { 'statusline', 'winbar', 'NvimTree' },
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
		}
	end
}
