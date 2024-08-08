return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({

      ensure_installed = {
        "bash",
        "css",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "toml",
        "typescript",
        "xml",
        "yaml",
      },

      auto_install = true,

      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })

  end,
}
