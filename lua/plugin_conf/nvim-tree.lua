-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- nvim-tree configuration
--

-- {{{ Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- }}}

require('nvim-tree').setup(
{
  view =
  {
    centralize_selection = true,
  },

  renderer =
  {
    add_trailing           = true,
    group_empty            = true,
    full_name              = true,
    indent_width           = 1,
    highlight_git          = "all";
    highlight_diagnostics  = "all";
    highlight_opened_files = "name";
    highlight_modified     = "all";

    icons =
    {
      padding = "  ",
    },
  },

  update_focused_file =
  {
    enable = true,
  },

  diagnostics =
  {
    enable = true,
  },

  modified =
  {
    enable = true,
  },

  filters =
  {
    git_ignored = false,
  },
})
