return {
	"saghen/blink.cmp",
	version = '*',
	event = { "InsertEnter" },
	opts = {
		keymap = { preset = "enter" },
		completion = {
			menu = { winhighlight = "FloatBorder:FloatBorder" },
			documentation = {
				auto_show = true,
				window = { winhighlight = "FloatBorder:FloatBorder" }
			},
		},
	}
}
