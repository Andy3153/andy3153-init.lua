-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- nvim-lightbulb config
--

require('nvim-lightbulb').setup(
{
  sign = { enabled = false, },
  line = { enabled = true, },
  float =
  {
    enabled = true,
    text    = " ",
  },
})
