-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- toggleterm.nvim configuration
--

require('toggleterm').setup(
{
  size = function(term)                      -- Size of terminal in split mode
    if term.direction == 'horizontal' then
      return opt.lines:get() * .2
    elseif term.direction == 'vertical' then
      return opt.columns:get() * .4
    end
  end,

  autochdir       = true,                    -- Change directory automatically
  start_in_insert = false,                   -- Don't start in insert mode
  direction       = 'horizontal',            -- How to start the terminal ( 'vertical' | 'horizontal' | 'tab' | 'float' )
})
