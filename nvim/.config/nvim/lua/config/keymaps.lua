-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("i", "jk", "<Esc>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", { desc = "Resize up", noremap = true, silent = true })
keymap("n", "<S-Down>", ":resize -2<CR>", { desc = "Resize down", noremap = true, silent = true })
keymap("n", "<S-Right>", ":vertical resize -2<CR>", { desc = "Resize left", noremap = true, silent = true })
keymap("n", "<S-Left>", ":vertical resize +2<CR>", { desc = "Resize right", noremap = true, silent = true })
