return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({

      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "typescript",
        "xml",
        "yaml",
      },

      -- install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- automatically install missing parsers when entering buffer
      auto_install = true,

      -- enable indenting
      indent = { enable = true, },

      -- enable highlighting
      highlight = { enable = true, },

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
