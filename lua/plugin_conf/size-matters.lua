-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- size-matters.nvim configuration
--

if vim.g.neovide or vim.g.goneovim or vim.g.nvui or vim.g.gnvim then
  require("size-matters")
end

require("size-matters").setup(
{
  default_mappings = false,
  step_size = 1,
  notifications =
  {
    enable  = true,
    timeout = 150,
    delay   = 300
  },

  reset_font = vim.api.nvim_get_option("guifont"),
})
