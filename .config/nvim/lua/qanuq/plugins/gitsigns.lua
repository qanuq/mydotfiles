return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {

    -- highlight line numbers
    numhl = true,
    -- highlight lines
    linehl = true,
    -- highlight word diff
    word_diff = true,

    -- show blame at end of current line
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 0,
      ignore_whitespace = true,
    },

    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, desc)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, { desc = desc })
      end

      -- Navigation
      map('n', '<Leader>hn', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gs.nav_hunk('next')
        end
      end, "Next hunk")

      map('n', '<Leader>hp', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gs.nav_hunk('prev')
        end
      end, "Prev hunk")
      map("n", "<Leader>hf", function() gs.nav_hunk('first') end, "First Hunk")
      map("n", "<Leader>hl", function() gs.nav_hunk('last') end, "Last Hunk")

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, "Stage hunk")
      map('n', '<leader>hr', gs.reset_hunk, "Reset hunk")
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Stage hunk")
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Reset hunk")
      map('n', '<leader>hS', gs.stage_buffer, "Stage buffer")
      map('n', '<leader>hR', gs.reset_buffer, "Reset buffer")
      map('n', '<leader>hu', gs.undo_stage_hunk, "Undo last stage hunk")
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, "Blame line")
      map('n', '<leader>hB', gs.toggle_current_line_blame, "Toggle line blame")
      map('n', '<leader>hd', gs.diffthis, "Diff this")
      map('n', '<leader>hx', gs.toggle_deleted, "Toggle deleted lines display")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<Enter>", "Select hunk")
    end,
  },
}
