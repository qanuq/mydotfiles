return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<Leader>w/", "<Cmd>SessionSearch<Enter>", desc = "Session search for CWD" },
    { "<leader>wr", ":SessionRestore<Enter>",  desc = "Restore session for cwd" },
    { "<Leader>ws", "<Cmd>SessionSave<Enter>", desc = "Save session for CWD" },
    { "<Leader>wt", "<Cmd>SessionToggleAutoSave<Enter>", desc = "Toggle autosave" },
  },
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore = true,
      use_git_branch = true,
      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "~/Documents",
        "~/Desktop",
      },
      bypass_save_filetypes = {
        "alpha",
        "NvimTree",
      },
    })
  end,
}
