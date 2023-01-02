-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- auto-session config
--

require('auto-session').setup(
{
  log_level                        = 'info', -- Sets the log level of the plugin
  auto_session_enable_last_session = false,  -- Loads the last loaded session if session for cwd does not exist
  auto_session_enabled             = true,   -- Enables/disables the plugin's auto save and restore features
  auto_session_create_enabled      = false,  -- Enables/disables the plugin's session auto creation
  auto_restore_enabled             = true    -- Enables/disables auto restoring
})
