return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    priority = 900,
  },
}
