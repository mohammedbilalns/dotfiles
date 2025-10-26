-- leader key 
vim.g.mapleader = " "

local keymap = vim.keymap
-- window management 
keymap.set("n","<leader>sv","<C-w>v", {desc = "Split window vertically"})
keymap.set("n","<leader>sh", "<C-w>s", {desc = "Split window horizontally"})
keymap.set("n","<leader>se", "<C-w>=", {desc = "Split windows equally"})
keymap.set("n","<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})

-- tab management 
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc="Open a new Tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close curren Tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to previouse tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open buffer in new tab"})
