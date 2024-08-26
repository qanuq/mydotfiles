return {
  -- :h comment.config
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- ignores empty lines
    ignore = "^$",
  },
}
