return {
	"ibhagwan/fzf-lua",
	keys = {
		{"<C-F>", [[<CMD>FzfLua<CR>]] },
		{"<C- >", [[<CMD>FzfLua files resume=true header=false<CR>]] },
		{"<C-G>", [[<CMD>FzfLua live_grep resume=true header=false<CR>]] },
	},
	opts = {
		winopts = {
			width = 0.8,
			height = 0.8,
			row = 0.5,
			col = 0.5,
			border = "single"
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
