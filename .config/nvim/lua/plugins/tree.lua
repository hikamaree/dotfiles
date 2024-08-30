return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-n>", "<CMD>NvimTreeToggle<CR>" }
	},
	config = function()
		require("nvim-tree").setup {
			renderer = {
				icons = {
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
				}
			},
		}
	end
}
