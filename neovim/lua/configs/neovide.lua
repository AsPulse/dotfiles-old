local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

vim.g.neovide_transparency = 0
vim.g.transparency = 0.9
vim.g.neovide_background_color = "#2b2541" .. alpha();
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_density = 15

-- vim.g.neovide_transparency = 0.5
