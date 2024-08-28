return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
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
        "diff",
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
        "regex",
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

      textobjects = {
        select = {
          enable = true,

          lookahead = true,

          -- TODO: improve all mappings
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

            ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
            ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner",  -- swap parameter with next
            ["<leader>nf"] = "@function.outer",   -- swap function with next
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",  -- swap parameters with prev
            ["<leader>pf"] = "@function.outer",   -- swap function with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [";f"] = { query = "@function.outer", desc = "Next function def start" },
            [";c"] = { query = "@class.outer", desc = "Next class start" },
          },
          goto_next_end = {
            [";F"] = { query = "@function.outer", desc = "Next function def end" },
            [";C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            [",f"] = { query = "@function.outer", desc = "Prev function def start" },
            [",c"] = { query = "@class.outer", desc = "Prev class start" },
          },
          goto_previous_end = {
            [",F"] = { query = "@function.outer", desc = "Prev function def end" },
            [",C"] = { query = "@class.outer", desc = "Prev class end" },
          },
        },
      },
    })
  end,
}
