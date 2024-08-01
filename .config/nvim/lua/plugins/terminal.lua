return {
	"numToStr/FTerm.nvim",
	config = function ()
		require'FTerm'.setup({
			border = 'rounded',
			dimensions  = {
				height = 0.8,
				width = 0.8,
			},
		})
	end
}
