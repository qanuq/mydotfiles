-- -- shows global mark M
-- vim.api.nvim_del_mark("M") -- reset on session start
-- local function markM()
-- 	local markObj = vim.api.nvim_get_mark("M", {})
-- 	local markLn = markObj[1]
-- 	local markBufname = vim.fs.basename(markObj[4])
-- 	if markBufname == "" then return "" end -- mark not set
-- 	return " " .. markBufname .. ":" .. markLn
-- end
--
-- local lualineConfig = {
-- 	tabline = {
-- 		lualine_a = {
-- 			{
-- 				"tabs",
-- 				mode = 1,
-- 				max_length = vim.o.columns * 0.7,
-- 				cond = function() return fn.tabpagenr("$") > 1 end,
-- 			},
-- 		},
-- 		lualine_y = {
-- 			{ markM },
-- 		},
-- 	},
-- 	sections = {
-- 		lualine_x = {
-- 			{ irregularWhitespace },
-- 		},
-- 	},
-- }


return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#33ccff",
      green = "#33ff33",
      magenta  = '#cc99cc',
      orange = "#ff9900",
      red = "#ff3333",
      violet = "#ff66ff",
      yellow = "#ffff00",
      bg = "#003333",
      fg = "#cccccc",
      inactive_bg = "#336666",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        z = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        z = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        z = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        z = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        z = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        z = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }
    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        -- XXX: if vim.fn.winwidth(0) > 80 then
        --   print(">>>>>>> 80")
        -- end
        return vim.fn.winwidth(0) > 80
      end,
    }
    -- TODO: use this
    local function selectionCount()
      local isVisualMode = fn.mode():find("[Vv]")
      if not isVisualMode then return "" end
      local starts = fn.line("v")
      local ends = fn.line(".")
      local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
      return " " .. tostring(lines) .. "L " .. tostring(fn.wordcount().visual_chars) .. "C"
    end

    lualine.setup({
      options = {
        theme = my_lualine_theme,
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
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
          },
          {
            'diff',
            symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
          },
          {
            "diagnostics",
            -- sources = { 'nvim_diagnostic' },
            symbols = { error = " ", warn = " ", info = " ", hint = " ", },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.orange },
              info = { fg = colors.yellow },
              hint = { fg = colors.green },
            },
            always_visible = true,
          },
        },
        lualine_c = {
          {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
          },
          {
            'filesize',
            cond = conditions.buffer_not_empty,
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          {
            "filetype"
          },
          {
            "encoding",
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = 'bold' },
          },
          {
            "fileformat",
            -- XXX: icons_enabled = false,
            color = { fg = colors.green, gui = 'bold' },
          },
        },
        lualine_y = {
          {
            "searchcount",
            color = { fg = colors.red, gui = 'bold' },
          },
          {
            "selectioncount",
            padding = {
              left = 0,
              right = 1,
            },
          },
        },
        lualine_z = {
          {
            'progress',
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            'location',
            padding = {
              left = 1,
              right = 1,
            },
          },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
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
