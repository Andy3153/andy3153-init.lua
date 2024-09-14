-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- trouble.nvim config
--

require('trouble').setup(
{
  modes =
  {
    -- {{{ Local diagnostics
    local_diagnostics =
    {
      mode     = "diagnostics",
      type     = "split",
      relative = "win",
      position = "right",

      filter =
      {
        any =
        {
          buf = 0,
          {
            severity = vim.diagnostic.severity.ERROR,
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    },
    -- }}}

    -- {{{ Project-wide diagnostics
    diagnostics =
    {
      mode     = "diagnostics",
      type     = "split",
      relative = "win",
      position = "right",

      preview =
      {
        type      = "float",
        relative  = "editor",
        border    = "rounded",
        title     = "Preview",
        title_pos = "center",
        position  = { 0, -2 },
        size = { width = 0.3, height = 0.3 },
        zindex    = 200,
      },
    },
    -- }}}
  },
})
