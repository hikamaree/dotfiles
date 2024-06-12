return {
	misc = {
		dots = "󰇘",
		error = "",
	},
	dap = {
		Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
		Breakpoint = " ",
		BreakpointCondition = " ",
		BreakpointRejected = { " ", "DiagnosticError" },
		LogPoint = ".>",
	},
	diagnostics = {
		Error = "󰅚 ",
		Warn = "󰀪 ",
		Hint = " ",
		Info = " ",
	},
	tree = {
		symlink_arrow = "  ",
		glyphs = {
			default = "󰈤",
			symlink = "󱀹",
			git = {
				unstaged = "",
				staged = "",
				unmerged = "󰐕",
				renamed = "",
				deleted = "󰅖",
				untracked = "",
				ignored = "",
			},
			folder = {
				arrow_closed = "",
				arrow_open = "",
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
				symlink_open = "",
			},
		},
	},
	mason = {
		package_installed = "",
		package_pending = "",
		package_uninstalled = "",
	},
	lualine = {
		symbols = {
			modified = " ●",
			alternate_file = "",
			directory =  ""
		},
		component_separators = {
			left = "",
			right = ""
		},
		section_separators = {
			left = "",
			right = ""
		},
	}
}
