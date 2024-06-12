return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup {
			open_mapping = [[`]],
			shade_terminals = false,
			highlights = {
				FloatBorder = {
					guifg = "#414868",
				},
			},
			float_opts = {
				border = "curved",
			},
			direction = "float",
		}
	end
}
