--
-- nvim-scrollbar configuration
--

require("scrollbar").setup(
{
  excluded_buftypes  = g.buffertypes_to_exclude,
  excluded_filetypes = g.buffertypes_to_exclude,
})
