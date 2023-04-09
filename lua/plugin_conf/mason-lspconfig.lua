--
-- mason-lspconfig configuration
--

require("mason-lspconfig").setup(
{
    ensure_installed = lspservers_to_install,
})
