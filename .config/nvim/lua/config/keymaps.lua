local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<leader>nh", ":noh<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffers management
vim.api.nvim_set_keymap("n", "<leader>bf", ":bfirst<CR>", { desc = "Go to first buffer" })
vim.api.nvim_set_keymap("n", "<leader>bl", ":blast<CR>", { desc = "Go to last buffer" })
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprev<CR>", { desc = "Go to previous buffer" })
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current buffer" })

-- remap for dealing with line wrap.
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- do nothing with space
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- use F1 to invert list display instead of help
keymap.set('n', '<F1>', ':set invlist<CR>', { noremap = true, silent = true })
keymap.set('i', '<F1>', '<C-o>:set invlist<CR>', { noremap = true, silent = true })
