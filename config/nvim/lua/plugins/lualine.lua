return {
	"nvim-lualine/lualine.nvim",
    event = "VeryLazy",
	opts = {
		options = {
			component_separators = {
				left = "",
				right = ""
			},
			section_separators = {
				left = "",
				right = ""
			},
		},
		sections = {
			lualine_a = {"mode"},
			lualine_b = {{
				"diagnostics",
				symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
			}},
			lualine_c = {{
				"buffers",
				symbols = { modified = " #", alternate_file = "" },
			}},
			lualine_x = {},
			lualine_y = {"filetype"},
			lualine_z = {"location"}
		},
	}
}
