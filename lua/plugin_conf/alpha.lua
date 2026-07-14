-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- alpha-nvim configuration
--

local alpha_header = "lights"

-- {{{ Function shorthands
local alpha   = require('alpha')
local fortune = require('alpha.fortune')
local theme   = require('alpha.themes.dashboard') -- or alpha.themes.startify
local milli   = require('milli')
-- }}}

-- {{{ Header non-animated ASCII art
-- https://textkool.com/en/ascii-art-generator
-- https://texteditor.com/multiline-text-art/

local header_ascii_art =
{
  ascii_nvim_2d =
  {
    [[    /‾| /‾/__  ____|‾|  /‾(_)___ ___  ]],
    [[   /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
    [[  / /|  /  __/ /_/ / |/ / / / / / / / ]],
    [[ /_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
  },

  ascii_nvim_3d =
  {
    [[  ___   __    ______   ______   __   __   ________  ___ __ __      ]],
    [[ /__/\ /__/\ /_____/\ /_____/\ /_/\ /_/\ /_______/\/__//_//_/\     ]],
    [[ \::\_\\  \ \\::::_\/_\:::_ \ \\:\ \\ \ \\__.::._\/\::\| \| \ \    ]],
    [[  \:. `-\  \ \\:\/___/\\:\ \ \ \\:\ \\ \ \  \::\ \  \:.      \ \   ]],
    [[   \:. _    \ \\::___\/_\:\ \ \ \\:\_/.:\ \ _\::\ \__\:.\-/\  \ \  ]],
    [[    \. \`-\  \ \\:\____/\\:\_\ \ \\ ..::/ //__\::\__/\\. \  \  \ \ ]],
    [[     \__\/ \__\/ \_____\/ \_____\/ \___/_( \________\/ \__\/ \__\/ ]],
  },

  ascii_nvim_bloody =
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
  },

  ascii_nvim_ghost =
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
  },

  ascii_nvim_shadow =
  {
    [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
    [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
    [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
    [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
    [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
  },
}
-- }}}

-- {{{ Settings
alpha.setup(theme.config) -- Theme

if alpha_header:find("^ascii") then
  theme.section.header.val = header_ascii_art[alpha_header]                  -- Non-animated header
else
  milli_splash = alpha_header
  theme.section.header.val = milli.load({ splash = alpha_header }).frames[1] -- Load first frame of Milli splash
  milli.alpha(                                                               -- Animated header
  {
    loop   = true,
    splash = alpha_header
  })
end

theme.section.footer.val  = fortune() -- Footer

theme.section.buttons.val =           -- Menu
{
  theme.button('i',       '  New file',          ':enew<CR>'),
  theme.button('SPC SPC', '  Recent files',      ':Telescope oldfiles<CR>'),
  theme.button('SPC s s', '  Sessions',          ':AutoSession search<CR>'),
  theme.button('q',       '  Quit Neovim',       ':qall<CR>'),
}
-- }}}
