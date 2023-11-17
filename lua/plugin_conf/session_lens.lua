-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- session-lens config
--

require('session-lens').setup(
{
  path_display =
  {
    "relative",
  },

  theme_conf   =
  {
    border = true
  },

  previewer    = false,
  prompt_title = 'Sessions',
})

require("telescope").load_extension("session-lens") -- prelaod it
