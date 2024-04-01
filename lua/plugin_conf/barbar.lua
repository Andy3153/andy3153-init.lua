-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- barbar.nvim configuration
--

-- BufferNext through netrw
g.netrw_bufsettings = 'noma nomod nonu nowrap ro buflisted'

-- Disable auto setup
g.barbar_auto_setup = false

-- Set barbar's options
require('barbar').setup(
{
  icons =
  {
    buffer_index = true,
    filetype = { enabled = true },

    modified = { button = ' ' },
    inactive = { button = '' },
    current  = { button = '' },
    pinned   = { button = '󰐃' },

    gitsigns =
    {
      added   = { enabled = true, icon = '+' },
      changed = { enabled = true, icon = '~' },
      deleted = { enabled = true, icon = '-' },
    },
  },

  sidebar_filetypes =
  {
    NvimTree = true,
  },

  no_name_title = "Empty buffer",
})
