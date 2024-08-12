return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd[[colorscheme tokyonight]]

    local themes = {"tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm"}

    local function cycle_themes()
      local current_theme = vim.g.colors_name
      local next_theme_index = 1

      for i, theme in ipairs(themes) do
        if theme == current_theme then
          next_theme_index = i % #themes + 1
          break
        end
      end

      local next_theme = themes[next_theme_index]
      vim.cmd.colorscheme(next_theme)
    end

    vim.keymap.set("n", "<F5>", cycle_themes, { noremap = true, silent = true })
    vim.keymap.set("i", "<F5>", cycle_themes, { noremap = true, silent = true })
  end,
}
