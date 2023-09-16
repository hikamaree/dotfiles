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

        for i in pairs(servers) do
            require("lspconfig")[servers[i]].setup{}
        end

    end
}}
