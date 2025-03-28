return {
	"ibhagwan/fzf-lua",
	keys = {
		{"<C-F>", [[<CMD>FzfLua<CR>]] },
		{"<C- >", [[<CMD>FzfLua files resume=true header=false<CR>]] },
		{"<C-G>", [[<CMD>FzfLua live_grep resume=true header=false<CR>]] },
	},
	opts = {
		winopts = {
			border = "none",
			preview = { border = "single" }
		},
	}
}
