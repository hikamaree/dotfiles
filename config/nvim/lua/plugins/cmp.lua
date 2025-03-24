return {
	"saghen/blink.cmp",
	version = '*',
	event = { "InsertEnter" },
	opts = {
		keymap = {
			preset = "enter",
			['<ESC>'] = { 'hide', 'fallback' },
		},
		completion = {
			menu = { border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder" },
			documentation = {
				auto_show = true,
				window = { border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder" }
			},
		},
		cmdline = { enabled = false },
	}
}
