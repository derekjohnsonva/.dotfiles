
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end


toggleterm.setup({
  open_mapping = [[<c-\>]],
  close_on_exit = true,
})

-- taken from toggleterm docs
function _G.set_terminal_keymaps()
  local opts = {buffer = 0, noremap = true}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  --  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  -- for some reason this remap causes the terminal to behaves
  -- in a way where j's are very laggy. This doesnt seem to 
  -- be an issue anywhere else
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
