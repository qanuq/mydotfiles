return {
  "declancm/maximize.nvim",

  config = function()
    local maximize = require('maximize')

    vim.keymap.set("n", "<Leader>sm", function()
      maximize.toggle()
    end, { desc = "Toggle maximize current window" })

    maximize.setup()
  end,
}
