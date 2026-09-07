-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Neovide configuration
--
-- https://neovide.dev/configuration.html
--

-- {{{ Variables
local padding = 5
local opacity = .8
-- }}}

-- {{{ Display
-- {{{ Padding
g.neovide_padding_top    = padding
g.neovide_padding_bottom = padding
g.neovide_padding_left   = padding
g.neovide_padding_right  = padding
-- }}}

-- {{{ Transparency
g.neovide_opacity        = opacity
g.neovide_normal_opacity = opacity
-- }}}

-- {{{ Progress bar
g.neovide_progress_bar_height          = padding
g.neovide_progress_bar_animation_speed = 400
g.neovide_progress_bar_hide_delay      = .15
-- }}}
-- }}}

-- {{{ Cursor settings
g.neovide_cursor_animation_length       = .15
g.neovide_cursor_short_animation_length = .05
-- }}}

-- {{{ Cursor particles
g.neovide_cursor_vfx_mode          = { "pixiedust", "ripple" }
g.neovide_cursor_vfx_particle_lifetime = .75
g.neovide_cursor_vfx_particle_highlight_lifetime = .175
g.neovide_cursor_vfx_particle_density = 2  -- particle density
-- }}}
