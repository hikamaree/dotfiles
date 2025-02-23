return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {"mode"},
			lualine_b = {{
				"diagnostics",
				symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " }
			}},
			lualine_c = {{
				"buffers",
				symbols = { modified = " #", alternate_file = "" },
			}},
			lualine_x = {
				function()
					local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
					local status = client and vim.lsp.status() or ""
					local load = (status ~= "" and status ~= "Idle") and "..." or ""
					return client.name .. load
				end
			},
			lualine_y = {
				"searchcount",
				function()
					local r_reg = vim.fn.reg_recording()
					return r_reg == "" and "" or "recording @" .. r_reg
				end,
			},
			lualine_z = {"location"}
		},
	}
}
