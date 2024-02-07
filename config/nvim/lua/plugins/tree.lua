return {
	'nvim-tree/nvim-tree.lua',
	config = function()
		require('nvim-tree').setup {
			renderer = {
				icons = require('config.icons').tree
			},
		}
	end
}
