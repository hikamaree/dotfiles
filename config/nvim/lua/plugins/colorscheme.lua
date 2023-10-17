return {{
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
        vim.cmd "colorscheme tokyonight-night"
        vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
    end
}}
