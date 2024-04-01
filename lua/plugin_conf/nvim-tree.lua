-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- nvim-tree configuration
--

-- {{{ Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- }}}

require('nvim-tree').setup()
