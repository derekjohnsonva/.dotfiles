local status_ok, _ = pcall(require, "glow")
if not status_ok then
  return
end

vim.keymap.set("n", "<leader>vm", ":Glow % <CR>",
  {desc="View current markown file", silent=true, noremap=true})
