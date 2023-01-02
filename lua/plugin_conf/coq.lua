-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- coq_nvim configuration
--

-- Enable coq on startup
  pcall(cmd[[COQnow --shut-up]])
  g.coq_settings =
  {
    auto_start = true,
    clients    =
    {
      tree_sitter =
      {
        enabled = true
      },
    },
  }
