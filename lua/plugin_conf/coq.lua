-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- coq_nvim configuration
--

-- Enable coq on startup
pcall(cmd[[COQnow --shut-up]])
g.coq_settings =
{
  auto_start = "shut-up",
  clients    =
  {
    tree_sitter =
    {
      enabled = true
    },
  },
}

-- Configure with LSP
for _, lsp in ipairs(lspservers_to_install) do
  require('lspconfig')[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end
