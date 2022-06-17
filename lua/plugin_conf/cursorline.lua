--
-- nvim-cursorline configuration
--

require('nvim-cursorline').setup
{
  cursorline =
  {
    enable = false,
  },
  cursorword =
  {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

g.cursorline_disabled_filetypes = g.buffertypes_to_exclude
g.cursorline_disabled_buftypes  = g.buffertypes_to_exclude
g.cursorword_disabled_filetypes = g.buffertypes_to_exclude
g.cursorword_disabled_buftypes  = g.buffertypes_to_exclude
