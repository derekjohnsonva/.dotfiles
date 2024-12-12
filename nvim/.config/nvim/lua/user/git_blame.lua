
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
-- Autocommand that sets up git blame
-- vim.api.nvim_create_autocmd("BufEnter",
--   { command= "EnableBlameLine"})

keymap("n", "<leader>gb", ":ToggleBlameLine<CR>", opts)

-- show blame info below the statusline isntead of using virtual text
-- vim.g.blameLineUseVirtualText = 0
