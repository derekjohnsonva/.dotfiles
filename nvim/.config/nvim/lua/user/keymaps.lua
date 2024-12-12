local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to right window", noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to above window", noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to below window", noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to left window", noremap = true, silent = true })

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", { desc = "Resize up", noremap = true, silent = true })
keymap("n", "<S-Down>", ":resize -2<CR>", { desc = "Resize down", noremap = true, silent = true })
keymap("n", "<S-Left>", ":vertical resize -2<CR>", { desc = "Resize left", noremap = true, silent = true })
keymap("n", "<S-Right>", ":vertical resize +2<CR>", { desc = "Resize right", noremap = true, silent = true })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text -- (This section gets repeated in visual and visual block
keymap("n", "<A-j>", "v:m .+1<CR>==<ESC>", opts)
keymap("n", "<A-k>", "v:m .-2<CR>==<ESC>", opts)

-- Toggle Lazygit
keymap("n", "<leader>gg", ":LazyGit<cr>", opts)

-- Insert --
-- Press jk or kj fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- write a function that deletes all buffers that
-- are not currently visible in a window

keymap("n", "<leader>bd", ":lua Clear_buffers()<cr>", term_opts)

function Clear_buffers()
  local bufs = {}
  for _, win in pairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if not bufs[buf] and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

-- Add diagnostics to the loc list
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(_)
    vim.diagnostic.setloclist({ open = false })
  end
})

function Toggle_loc_list()
  local winid = vim.fn.getloclist(0, { winid = 0 }).winid
  if winid == 0 then
    vim.cmd.lopen()
  else
    vim.cmd.lclose()
  end
end

keymap("n", "<leader>ll", ":lua Toggle_loc_list() <cr>", { desc = "open the issues window", noremap = true, silent = true })
