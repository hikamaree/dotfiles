return {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			width = 0.8,
			height = 0.8,
			row = 0.5,
			col = 0.5,
		},
		previewers = {
			cmdline = {
				preview = false,  -- Isključi prikaz poruka u pretraživaču
			},
		},
		fzf_opts = {
			["--info"] = "hidden",
		},
		fzf_colors = {
			["fg+"]     = { "fg", "CursorLine"},
			["bg+"]     = { "bg", "CursorLine"},
			["border"]  = { "fg", "CursorLine" },
			["pointer"] = { "fg", "Normal" },
			["marker"] = { "fg", "Normal" },
		},
	}
}
