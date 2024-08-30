return {
	"numToStr/FTerm.nvim",
	keys = {
		{ "<C-Enter>", function() require("FTerm").toggle() end}
	},
	opts = {
		border = 'rounded',
		dimensions  = {
			height = 0.8,
			width = 0.8,
		},
	}
}
