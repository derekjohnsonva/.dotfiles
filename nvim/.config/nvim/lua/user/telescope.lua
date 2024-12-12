-- Telescope Stuff --
-- -- Find Files and Whatnot -- --
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end
telescope.setup {
  defaults = {
    file_ignore_patterns = { "^.git/", "^node_modules/" }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
  }
}
local status_ok_builtin, builtin = pcall(require, 'telescope.builtin')
if not status_ok_builtin then
  return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
