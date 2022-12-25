--
-- Catppuccin config
--

require("catppuccin").setup(
{
  flavour                = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  term_colors            = true,

  dim_inactive           =
  {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
})
