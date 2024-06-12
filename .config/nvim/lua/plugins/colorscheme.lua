return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
		on_colors = function(colors)
			colors.border = "#414868"
			colors.bg_statusline = colors.none
		end
	}
}
