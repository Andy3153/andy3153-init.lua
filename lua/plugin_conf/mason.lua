--
-- mason configuration
--

require("mason").setup(
{
  automatic_installation = true,            -- Whether servers that are set up should be automatically installed if they're not already installed.
  max_concurrent_installers = 5,            -- Limit for simultaneous installs
})
