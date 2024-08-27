return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
    opts = {
      options = {
        -- TODO: diagnostic and mappings
        show_close_icon = false,
        show_buffer_close_icons = false,
        mode = "buffers",
        separator_style = "thin",
        numbers = "ordinal",
      },
    },
}
