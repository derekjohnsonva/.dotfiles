local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()
vim.diagnostic.config({
  virtual_text = true, -- displays a message about the error in virtual text
  signs = true, -- adds flags next to line number
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

require "user.lsp.null-ls"
