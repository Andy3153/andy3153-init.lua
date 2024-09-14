-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- lsp_signature.nvim config
--

-- {{{ Attach to LSPs
api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    require("lsp_signature").on_attach({ }, bufnr)
  end,
})
-- }}}
