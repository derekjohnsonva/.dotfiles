-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.g.neovide_floating_blur_amount_x = 4.0
  -- vim.g.neovide_floating_blur_amount_y = 4.0
  --
  -- vim.g.neovide_floating_corner_radius = 0.5

  -- Setting g:neovide_cursor_animation_length determines
  -- the time it takes for the cursor to complete it's animation in seconds.
  -- Set to 0 to disable.
  vim.g.neovide_cursor_animation_length = 0.13
end
