local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
local status_ok, lualinegruvbox= pcall(require, "lualine.themes.gruvbox")
if not status_ok then
  return
end


lualine.setup {
  options = {
    theme = lualinegruvbox
  },
}
