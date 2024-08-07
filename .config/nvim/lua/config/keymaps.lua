local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<leader>nh", ":noh<Enter>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<Enter>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", ":tabnew<Enter>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<Enter>", { desc = "Close current tab" })
keymap.set("n", "<leader>tp", ":tabp<Enter>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", ":tabn<Enter>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tf", ":tabnew %<Enter>", { desc = "Open current buffer in new tab" })

-- buffers management
keymap.set("n", "<leader>bf", ":bfirst<Enter>", { desc = "Go to first buffer" })
keymap.set("n", "<leader>bl", ":blast<Enter>", { desc = "Go to last buffer" })
keymap.set("n", "<leader>bp", ":bprev<Enter>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bn", ":bnext<Enter>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>bd", ":bdelete<Enter>", { desc = "Close current buffer" })

-- remap for dealing with line wrap.
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- do nothing with space
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- use F1 to invert list display instead of help
keymap.set('n', '<F1>', ':set invlist<Enter>', { noremap = true, silent = true })
keymap.set('i', '<F1>', '<C-o>:set invlist<Enter>', { noremap = true, silent = true })
