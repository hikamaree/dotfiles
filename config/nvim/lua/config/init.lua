require("config.options");

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local spec = {{
    import = "plugins"
}}

require("lazy").setup({
    root = vim.fn.stdpath("data") .. "/lazy",
    spec = spec,
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    defaults = {
        lazy = false,
        version = nil
    },
})

require("config.keymaps");
