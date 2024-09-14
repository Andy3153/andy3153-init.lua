--
-- nvim-lspconfig configuration
--

-- {{{ Appearance
vim.diagnostic.config(
{
  --[[virtual_text =
  {
    prefix = '■', -- Could be '●', '▎', 'x'
  },]]
  virtual_text = false, -- disable default virtual text
  virtual_lines = true, -- enable virtual lines from lsp_lines.nvim
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
-- }}}

-- {{{ Symbols for sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}
