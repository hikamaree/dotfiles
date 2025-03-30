return {
	"saghen/blink.cmp",
	version = '*',
	event = { "InsertEnter" },
	opts = {
		keymap = { preset = "enter" },
		completion = {
			menu = { border = "single", winhighlight = "FloatBorder:FloatBorder" },
			documentation = {
				auto_show = true,
				window = { border = "single", winhighlight = "FloatBorder:FloatBorder" }
			},
		},
		cmdline = { enabled = false },
	}
}
