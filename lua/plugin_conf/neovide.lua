--
-- Neovide configuration
--

g.neovide_transparency = 0.8              -- transparency
g.neovide_cursor_animation_length = 0.05  -- duration of cursor animation
g.neovide_cursor_vfx_mode = "ripple"    -- cursor effect
--g.neovide_cursor_vfx_mode = "torpedo" -- cursor effect


-- Make Ctrl-+ and Ctrl-- work like in a terminal
g.gui_font_default_size = 8.05          -- default font size
g.gui_font_size = g.gui_font_default_size
g.gui_font_face = "Iosevka Nerd Font Mono"

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
