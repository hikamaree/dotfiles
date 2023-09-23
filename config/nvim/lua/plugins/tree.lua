return {{
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup{
            renderer = {icons = {glyphs = { git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "R",
                deleted = "",
                untracked = "U",
                ignored = "◌",
            }}}}
        }
    end
}}
