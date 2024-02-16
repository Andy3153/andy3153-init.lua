-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Things still in Vimscript
--

cmd
[[
  "syntax on                " Make sure syntax highlighting is on by default

  filetype plugin indent on " Use language‐specific plugins for indenting

  " Abbreviations
  " Make 'w' and 'q' case insensitive
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))

  " Make help window open on the right
  cnoreabbrev h vert help
  cnoreabbrev help vert help
]]

if not lightweightMode then
-- {{{ --- Normal mode---
cmd
[[
  " Colorscheme
  try
    colorscheme catppuccin
  catch
  endtry
]]
-- }}}
else
-- {{{ --- Normal mode---
cmd
[[
  colorscheme slate
]]
-- }}}
end
