-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- alpha-nvim configuration
--

-- {{{ Function shorthands
local alpha   = require('alpha')
local fortune = require("alpha.fortune")
local theme   = require('alpha.themes.dashboard') -- or alpha.themes.startify
-- }}}

-- {{{ Some ASCII art
-- https://textkool.com/en/ascii-art-generator
-- https://texteditor.com/multiline-text-art/

local ascii_nvim_2d =
{
  [[    /‾| /‾/__  ____|‾|  /‾(_)___ ___  ]],
  [[   /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
  [[  / /|  /  __/ /_/ / |/ / / / / / / / ]],
  [[ /_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
}

local ascii_nvim_3d =
{
  [[  ___   __    ______   ______   __   __   ________  ___ __ __      ]],
  [[ /__/\ /__/\ /_____/\ /_____/\ /_/\ /_/\ /_______/\/__//_//_/\     ]],
  [[ \::\_\\  \ \\::::_\/_\:::_ \ \\:\ \\ \ \\__.::._\/\::\| \| \ \    ]],
  [[  \:. `-\  \ \\:\/___/\\:\ \ \ \\:\ \\ \ \  \::\ \  \:.      \ \   ]],
  [[   \:. _    \ \\::___\/_\:\ \ \ \\:\_/.:\ \ _\::\ \__\:.\-/\  \ \  ]],
  [[    \. \`-\  \ \\:\____/\\:\_\ \ \\ ..::/ //__\::\__/\\. \  \  \ \ ]],
  [[     \__\/ \__\/ \_____\/ \_____\/ \___/_( \________\/ \__\/ \__\/ ]],
}

local ascii_shadow =
{
  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
}

local ascii_bloody =
{
[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
[[                                 ░                   ]],
}

local ascii_ghost =
{
  [[ ▀███▄   ▀███▀███▀▀▀███  ▄▄█▀▀██▄ ▀████▀   ▀███▀████▀████▄     ▄███▀ ]],
  [[   ███▄    █   ██    ▀█▄██▀    ▀██▄ ▀██     ▄█   ██   ████    ████   ]],
  [[   █ ███   █   ██   █  ██▀      ▀██  ██▄   ▄█    ██   █ ██   ▄█ ██   ]],
  [[   █  ▀██▄ █   ██████  ██        ██   ██▄  █▀    ██   █  █▓  █▀ ██   ]],
  [[   █   ▀██▄▓   ██   █  ▄█        ██   ▀▓█ ▓▀     █▓   ▓  █▓▄█▀  ██   ]],
  [[   ▓     ▓█▓   █▓     ▄███      ██▀    ▓██▄      █▓   ▓  ▀▓█▀   ██   ]],
  [[   ▓   ▀▓▓▓▓   ▓▓   ▓  ▓██      ▓█▓    ▓▓ ▓▀     ▓▓   ▓  ▓▓▓▓▀  ▓▓   ]],
  [[   ▓     ▓▓▓   ▓▓     ▓▓█▓▓▓    ▓▓▓    ▓▓▒▒      ▒▓   ▒  ▀▓▓▀   ▓▓   ]],
  [[ ▒ ▒ ▒    ▒▓▓▒ ▒▒▒▓▒ ▒ ▒ ▒ ▒ ▒ ▒        ▒      ▒▓▒ ▒▒ ▒▒▒ ▒   ▒ ▒▒▒  ]],
}
-- }}}

-- {{{ Settings
alpha.setup(theme.config)                         -- Theme
theme.section.header.val  = ascii_bloody           -- Header
theme.section.footer.val  = fortune()              -- Footer
theme.section.buttons.val =                       -- Menu
{
  theme.button('i',       '  New file',          ':enew<CR>'),
  theme.button('SPC SPC', '  Recent files',      ':Telescope oldfiles<CR>'),
  theme.button('SPC s s', '  Sessions',          ':SearchSession<CR>'),
  theme.button('SPC r',   '  Ranger',            ':RnvimrToggle<CR>'),
  theme.button('SPC T',   '  Floating terminal', ':ToggleTerm direction=float dir=%:p:h<CR>'),
  theme.button('SPC t',   '  Vsplit terminal',   ':ToggleTerm direction=vertical dir=%:p:h<CR>'),
  theme.button('q',       '  Quit Neovim',       ':qall<CR>'),
}
-- }}}
