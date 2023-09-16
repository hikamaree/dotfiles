local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local spec = {{
    import = "plugins"
}}

local ok, err = pcall(require, "plugins.custom")
if ok then
    spec = {{
        import = "plugins"
    }, {
        import = "plugins.custom"
    }}
end

require("lazy").setup({
    root = vim.fn.stdpath("data") .. "/lazy",
    spec = spec,
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    defaults = {
        lazy = false,
        version = nil
    },
})

local modules = {"config.options", "config.keymaps"}

for _, mod in ipairs(modules) do
    local ok, err = pcall(require, mod)
    if not ok and not mod == "config/custom" then
        error(("Error loading %s...\n\n%s"):format(mod, err))
    end
end
