--
-- nvim-lspconfig configuration
--

-- {{{ Appearance
vim.diagnostic.config(
{
  virtual_text =        -- enable virtual text on all lines
  {
    prefix = '■', -- ● ■
  },

  virtual_lines =       -- enable virtual lines only on current line
  {
    only_current_line    = true,
    highlight_whole_line = false,
  },

  signs            = true,
  underline        = true,
  update_in_insert = true,
  severity_sort    = false,
})
-- }}}

-- {{{ Symbols for sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}
