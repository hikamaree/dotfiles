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
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = { border = "single" }
			},
			menu = {
				border = "single",
				winhighlight = "Normal:Normal",
				draw = { columns = { { 'kind_icon' }, { 'label' } } }
			},
		},
		sources = { cmdline = {} },
	}
}
