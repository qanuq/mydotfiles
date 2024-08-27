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
  opts = {
    auto_restore = true,
    bypass_save_filetypes = { "alpha", "NvimTree", "checkhealth", },
    suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop", },
    use_git_branch = true,
  }
}
