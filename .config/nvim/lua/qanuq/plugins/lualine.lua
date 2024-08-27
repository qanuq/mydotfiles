return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local tokyo = require("tokyonight.colors").setup()

    -- https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        lualine.refresh({
          place = { "statusline" },
        })
      end,
    })
    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
          50,
          0,
          vim.schedule_wrap(function()
            lualine.refresh({
              place = { "statusline" },
            })
          end)
        )
      end,
    })

    local colors = {
      black = "#000000",
      blue = "#33ccff",
      gray = "#333333",
      green = "#33ff33",
      orange = "#ff9900",
      red = "#ff3333",
      yellow = "#ffff00",
    }

    local lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = tokyo.bg, fg = tokyo.fg },
        c = { bg = tokyo.bg, fg = tokyo.fg },
        x = { bg = tokyo.bg, fg = tokyo.red },
        y = { bg = tokyo.bg, fg = tokyo.teal },
        z = { bg = tokyo.bg, fg = tokyo.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = { bg = tokyo.bg, fg = tokyo.fg },
        c = { bg = tokyo.bg, fg = tokyo.fg },
        x = { bg = tokyo.bg, fg = tokyo.red },
        y = { bg = tokyo.bg, fg = tokyo.teal },
        z = { bg = tokyo.bg, fg = tokyo.fg },
      },
      visual = {
        a = { bg = colors.orange, fg = colors.black, gui = "bold" },
        b = { bg = tokyo.bg, fg = tokyo.fg },
        c = { bg = tokyo.bg, fg = tokyo.fg },
        x = { bg = tokyo.bg, fg = tokyo.red },
        y = { bg = tokyo.bg, fg = tokyo.teal },
        z = { bg = tokyo.bg, fg = tokyo.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = tokyo.bg, fg = tokyo.fg },
        c = { bg = tokyo.bg, fg = tokyo.fg },
        x = { bg = tokyo.bg, fg = tokyo.red },
        y = { bg = tokyo.bg, fg = tokyo.teal },
        z = { bg = tokyo.bg, fg = tokyo.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = tokyo.bg, fg = tokyo.fg },
        c = { bg = tokyo.bg, fg = tokyo.fg },
        x = { bg = tokyo.bg, fg = tokyo.red },
        y = { bg = tokyo.bg, fg = tokyo.teal },
        z = { bg = tokyo.bg, fg = tokyo.fg },
      },
      inactive = {
        a = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
        b = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
        c = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
        x = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
        y = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
        z = { bg = tokyo.bg_dark, fg = tokyo.fg_dark },
      },
    }

    local function checkModified()
      if vim.bo.modified then
        return '+'
      elseif not vim.bo.modifiable or vim.bo.readonly then
        return '-'
      end
      return ' '
    end

    local function macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "Rec. @" .. recording_register
      end
    end

    lualine.setup({

      options = {
        theme = lualine_theme,
        component_separators = '',
        section_separators = '',
        ignore_focus = {
          "NvimTree",
          -- TODO: "DressingInput",
          -- "DressingSelect",
          -- "ccc-ui",
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            'branch',
            icon = '',
            color = { bg = colors.gray, fg = tokyo.green },
          },
          {
            'diff',
            -- symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            symbols = { added = ' ', modified = '󰜥 ', removed = ' ' },
            diff_color = {
              added = { bg = colors.gray, fg = colors.green },
              modified = { bg = colors.gray, fg = colors.orange },
              removed = { bg = colors.gray, fg = colors.red },
            },
          },
          {
            'diagnostics',
            -- TODO: source = { 'nvim', 'nvim_diagnostic' },
            sections = { 'error' },
            symbols = { error = " "},
            diagnostics_color = { error = { bg = tokyo.red, fg = tokyo.bg } },
          },
          {
            'diagnostics',
            sections = { 'warn' },
            symbols = { warn = " " },
            diagnostics_color = { warn = { bg = tokyo.orange, fg = tokyo.bg } },
          },
          {
            'diagnostics',
            sections = { 'info' },
            symbols = { info = "󰋼 " },
            diagnostics_color = { info = { bg = tokyo.blue, fg = tokyo.bg } },
          },
          {
            'diagnostics',
            sections = { 'hint' },
            symbols = { hint = " " },
            diagnostics_color = { hint = { bg = tokyo.green, fg = tokyo.bg } },
          },
        },
        lualine_c = {
          {
            'filename',
            file_status = false, -- do not show modified or readonly
            path = 1, -- relative path
            color = { fg = tokyo.fg },
            padding = { left = 1, right = 0, },
          },
          {
            checkModified,
            color = { fg = tokyo.red, gui = "bold" },
            padding = { left = 0, right = 0, },
          },
          {
            'filesize',
            padding = { left = 1, right = 0, },
          },
        },
        lualine_x = {
          {
            macro_recording,
            padding = { left = 1, right = 0, },
            color = { gui = "bold" },
          },
          {
            "selectioncount",
            padding = { left = 1, right = 0, },
            color = { gui = "bold" },
          },
          {
            "searchcount",
            padding = { left = 1, right = 0, },
            color = { gui = "bold" },
          },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = tokyo.orange, gui = "bold" },
            padding = { left = 1, right = 0, },
          },
        },
        lualine_y = {
          {
            "filetype",
            padding = { left = 1, right = 0, },
          },
          {
            "encoding",
            padding = { left = 1, right = 0, },
          },
          {
            "fileformat",
            icons_enabled = false,
            padding = { left = 1, right = 0, },
          },
        },
        lualine_z = {
          {
            'progress',
            padding = { left = 1, right = 0, },
          },
          {
            'location',
            padding = { left = 1, right = 1, },
          },
        },
      },

      inactive_sections = {
        lualine_a = { "%f %y %m" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          'progress',
          'location',
        }
      },
    })


    -- TODO: ins_left {
    -- TODO:   -- Lsp server name .
    -- TODO:   function()
    -- TODO:     local msg = 'No Active Lsp'
    -- TODO:     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    -- TODO:     local clients = vim.lsp.get_active_clients()
    -- TODO:     if next(clients) == nil then
    -- TODO:       return msg
    -- TODO:     end
    -- TODO:     for _, client in ipairs(clients) do
    -- TODO:       local filetypes = client.config.filetypes
    -- TODO:       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    -- TODO:         return client.name
    -- TODO:       end
    -- TODO:     end
    -- TODO:     return msg
    -- TODO:   end,
    -- TODO:   icon = ' LSP:',
    -- TODO:   color = { fg = '#ffffff', gui = 'bold' },
    -- TODO: }

  end,
}
