return{{
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local servers = { "clangd", "rust_analyzer", "lua_ls" }

        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }

        for _, server in pairs(servers) do
            local ok, _ = pcall(require, "servers."..server)
            if not ok then
                require("lspconfig")[server].setup{}
            end
        end
    end
}}
