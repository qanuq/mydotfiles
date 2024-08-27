local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<Leader>nh", "<Cmd>noh<Enter>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<Leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<Leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<Leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<Leader>sx", "<Cmd>close<Enter>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<Leader>to", "<Cmd>tabnew<Enter>", { desc = "Open new tab" })
keymap.set("n", "<Leader>tx", "<Cmd>tabclose<Enter>", { desc = "Close current tab" })
keymap.set("n", "<Leader>tp", "<Cmd>tabp<Enter>", { desc = "Go to previous tab" })
keymap.set("n", "<Leader>tn", "<Cmd>tabn<Enter>", { desc = "Go to next tab" })
keymap.set("n", "<Leader>tf", "<Cmd>tabnew %<Enter>", { desc = "Open current buffer in new tab" })

-- buffers management
keymap.set("n", "<Leader>bf", "<Cmd>bfirst<Enter>", { desc = "Go to first buffer" })
keymap.set("n", "<Leader>bl", "<Cmd>blast<Enter>", { desc = "Go to last buffer" })
keymap.set("n", "<Leader>bp", "<Cmd>bprev<Enter>", { desc = "Go to previous buffer" })
keymap.set("n", "<Leader>bn", "<Cmd>bnext<Enter>", { desc = "Go to next buffer" })
keymap.set("n", "<Leader>bd", "<Cmd>bdelete<Enter>", { desc = "Close current buffer" })

-- remap for dealing with line wrap.
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- do nothing with space
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- use F1 to invert list display instead of help
-- keymap.set('n', '<F1>', '<Cmd>set invlist<Enter>', { noremap = true, silent = true })
keymap.set('n', '<F1>', '<Cmd>set invlist<Enter>', { noremap = true, silent = true })
keymap.set('i', '<F1>', '<C-o><Cmd>set invlist<Enter>', { noremap = true, silent = true })

-- use F2 to invert wrap
keymap.set('n', '<F2>', '<Cmd>set invwrap<Enter>', { noremap = true, silent = true })
keymap.set('i', '<F2>', '<C-o><Cmd>set invwrap<Enter>', { noremap = true, silent = true })

-- use F3 to invert spell
keymap.set('n', '<F3>', '<Cmd>set invspell<Enter>', { noremap = true, silent = true })
keymap.set('i', '<F3>', '<C-o><Cmd>set invspell<Enter>', { noremap = true, silent = true })

-- F5 is used for colorscheme cycle
