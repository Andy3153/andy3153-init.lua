--
-- indent-blankline.nvim configuration
--

local highlight =
{
  "RainbowRed",
  "RainbowOrange",
  "RainbowYellow",
  "RainbowGreen",
  "RainbowBlue",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes

if string.find(g.colors_name, "catppuccin") then
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    api.nvim_set_hl(0, "RainbowRed",    { fg = getCatppuccinColor("mocha", "red")      })
    api.nvim_set_hl(0, "RainbowYellow", { fg = getCatppuccinColor("mocha", "yellow")   })
    api.nvim_set_hl(0, "RainbowBlue",   { fg = getCatppuccinColor("mocha", "blue")     })
    api.nvim_set_hl(0, "RainbowOrange", { fg = getCatppuccinColor("mocha", "peach")    })
    api.nvim_set_hl(0, "RainbowGreen",  { fg = getCatppuccinColor("mocha", "green")    })
    api.nvim_set_hl(0, "RainbowViolet", { fg = getCatppuccinColor("mocha", "lavender") })
    api.nvim_set_hl(0, "RainbowCyan",   { fg = getCatppuccinColor("mocha", "teal")     })
  end)
else
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
    api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
    api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
    api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
  end)
end

require("ibl").setup
{
  exclude =
  {
    filetypes = buffertypes_to_exclude;
    buftypes =  buffertypes_to_exclude;
  };

  indent = { highlight = highlight };
}
