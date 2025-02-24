local M = {}

-- Function to toggle transparent background
M.toggle_transparent_background = function()
  if vim.g.gruvbox_material_transparent_background == 1 then
    vim.g.gruvbox_material_transparent_background = 0
  else
    vim.g.gruvbox_material_transparent_background = 1
  end
  -- Reload the colorscheme to apply changes
  vim.cmd("colorscheme gruvbox-material")
  print("Transparent background: " .. (vim.g.gruvbox_material_transparent_background == 1 and "ON" or "OFF"))
end

-- Set keybinding for toggling transparent background
vim.keymap.set("n", "<leader>ut", M.toggle_transparent_background, { desc = "Toggle Transparent Background" })

return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_ui_contrast = "high"
      -- To make the background not transparent, update this to 0
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
