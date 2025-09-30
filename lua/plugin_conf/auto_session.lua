-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- auto-session config
--

require('auto-session').setup(
{
  auto_save    = true,  -- Enables/disables auto saving session on exit
  auto_restore = false, -- Enables/disables auto restoring session on start
  auto_create  = false, -- Enables/disables auto creating new session files. Can be a function that returns true if a new session file should be allowed

  git_use_branch_name               = true, -- Include git branch name in session name, can also be a function that takes an optional path and returns the name of the branch
  git_auto_restore_on_branch_change = true, -- Should we auto-restore the session when the git branch changes. Requires git_use_branch_name

  legacy_cmds = false, -- Define legacy commands: Session*, Autosession (lowercase s), currently true. Set to false to prevent defining them

  bypass_save_filetypes = buffertypes_to_exclude,
})
