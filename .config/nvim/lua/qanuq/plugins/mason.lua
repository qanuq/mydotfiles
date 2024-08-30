return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local mason = require("mason")
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "v",
                        package_pending = "~",
                        package_uninstalled = "x",
                    },
                },
            })

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {
                    "bashls",
                    "biome",
                    "clangd",
                    "cmake",
                    "cssls",
                    "lua_ls",
                    "ruff_lsp",
                    "rust_analyzer",
                }
            })

            local lspconfig = require("lspconfig")
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
            })
        end,
    },
}
