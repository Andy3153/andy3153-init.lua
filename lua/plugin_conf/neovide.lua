--
-- Neovide configuration
--

g.neovide_transparency = 0.8              -- transparency
g.neovide_cursor_animation_length = 0.08  -- duration of cursor animation
g.neovide_cursor_vfx_mode = "ripple"      -- cursor effect

-- Refresh rate
g.neovide_refresh_rate = 240
g.neovide_refresh_rate_idle = 5

-- Make Ctrl-+ and Ctrl-- work like in a terminal
g.gui_font_default_size = 12              -- default font size
g.gui_font_size = g.gui_font_default_size
g.gui_font_face = "IosevkaTerm NF"

RefreshGuiFont = function()
  opt.guifont = string.format("%s:h%s", g.gui_font_face, g.gui_font_size)
end

ResizeGuiFont = function(delta)
  g.gui_font_size = g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function ()
  g.gui_font_size = g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()
