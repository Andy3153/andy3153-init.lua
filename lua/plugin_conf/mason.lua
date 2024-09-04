--
-- Mason configuration
--

require("mason").setup(
{
  max_concurrent_installers = 5, -- Limit for simultaneous installs
  PATH = "append",               -- Use system packages when available (useful for NixOS)
})
