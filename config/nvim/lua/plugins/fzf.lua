return {
	"ibhagwan/fzf-lua",
	keys = {
		{ "<C-F>", [[<CMD>FzfLua<CR>]] },
		{ "<C- >", [[<CMD>FzfLua files resume=true header=false<CR>]] },
		{ "<C-G>", [[<CMD>FzfLua live_grep resume=true header=false<CR>]] },
		{ "grr", [[<CMD>FzfLua lsp_references resume=true header=false<CR>]] },
		{ "wd", [[<CMD>FzfLua lsp_workspace_diagnostics resume=true header=false<CR>]] },
		{ "gra", [[<CMD>FzfLua lsp_code_actions resume=true header=false<CR>]] },
	},
	opts = {
		winopts = {
			border = "none",
			preview = { border = "single" }
		},
	}
}
