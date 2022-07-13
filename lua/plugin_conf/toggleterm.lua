-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- toggleterm.nvim configuration
--

require('toggleterm').setup(
{
  size            = getHalfColumnSize(), -- Size of terminal in split mode
  hide_numbers    = true,       -- Hide line numbering
  shade_terminals = true,       -- Shade the background
  shading_factor  = '2',        -- How much to shade
  start_in_insert = false,      -- Don't start in insert mode
  direction       = 'vertical', -- How to start the terminal ( 'vertical' | 'horizontal' | 'tab' | 'float' )
})
