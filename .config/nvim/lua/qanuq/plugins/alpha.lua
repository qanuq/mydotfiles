return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- dashboard.section.header.val = {
    --   "                                                     ",
    --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    --   "                                                     ",
    -- }

    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#DA4939" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FF875F" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFC66D" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#00FF03" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#00AFFF" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#8800FF" })

    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<Cmd>ene <Bar> startinsert<Enter>"),
      dashboard.button("Space ee", "  Toggle file explorer", "<Cmd>TreeToggle<Enter>"),
      dashboard.button("Space wr", "󰁯  Restore CWD Session", "<Cmd>SessionRestore<Enter>"),
      dashboard.button("l", "󰚰  Lazy", "<Cmd>Lazy<Enter>"),
      dashboard.button("s", "  Settings", "<Cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd l | pwd<Enter>"),
      dashboard.button("q", "  Quit NVIM", "<Cmd>qa<Enter>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
