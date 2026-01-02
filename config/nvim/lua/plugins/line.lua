return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {{
				"diagnostics",
				symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " }
			}},
			lualine_c = {{
				"buffers",
				symbols = { modified = " #", alternate_file = "" },
				buffers_color = {
					active = { fg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg) },
					inactive = { fg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Comment" }).fg) },
				},
			}},
			lualine_x = {
				function()
					local c = vim.lsp.get_clients({ bufnr = 0 })[1]
					return c and c.name .. (vim.lsp.status():match("%S") and "..." or "") or ""
				end
			},
			lualine_y = {
				"searchcount",
				function() return vim.fn.reg_recording():gsub("^(.+)$", "recording @%1") end
			},
			lualine_z = { "location" }
		},
	}
}
