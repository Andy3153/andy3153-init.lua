--
-- Neovide configuration
--

local g =   vim.g
local key = vim.keymap.set

g.neovide_transparency=0.8              -- transparency
g.neovide_cursor_animation_length=0.05  -- duration of cursor animation
--g.neovide_cursor_vfx_mode = "ripple"  -- cursor effect
g.neovide_cursor_vfx_mode = "railgun"   -- cursor effect


-- Make Ctrl-+ and Ctrl-- work like in a terminal
g.gui_font_default_size = 8.05          -- default font size
g.gui_font_size = g.gui_font_default_size
g.gui_font_face = "Iosevka Term"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s", g.gui_font_face, g.gui_font_size)
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


-- Keymaps
local opts = { noremap = true, silent = true }

key({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1)  end, opts)
key({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
key({'n', 'i'}, "<C-BS>", function() ResetGuiFont() end, opts)
