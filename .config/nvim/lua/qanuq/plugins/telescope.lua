return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                scroll_strategy = "limit",  -- do not cycle
                path_display = { "truncate" },
                prompt_prefix = " ",
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<Enter>", { desc = "Find files in CWD" })
        keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<Enter>", { desc = "Find recent files" })
        keymap.set("n", "<leader>fs", "<Cmd>Telescope live_grep<Enter>", { desc = "Find string in CWD" })
        keymap.set("n", "<leader>fc", "<Cmd>Telescope grep_string<Enter>", { desc = "Find string under cursor in CWD" })
        keymap.set("n", "<leader>ft", "<Cmd>TodoTelescope<Enter>", { desc = "Find TODO" })

    end,
}
