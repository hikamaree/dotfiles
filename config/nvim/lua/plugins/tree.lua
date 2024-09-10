return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-n>", "<CMD>NvimTreeToggle<CR>" }
	},
	config = function()
		require("nvim-tree").setup {
			renderer = {
				icons = {
					git_placement = "after",
					symlink_arrow = "  ",
					glyphs = {
						default = "󰈤",
						symlink = "󱀹",
						git = {
							unstaged = "n",
							renamed = "r",
							deleted = "x",
							untracked = "o",
						},
						folder = {
							arrow_closed = "",
							arrow_open = "",
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

