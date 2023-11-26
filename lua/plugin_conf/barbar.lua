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
  animation = true,  -- Enable/disable animations
  auto_hide = false, -- Enable/disable auto-hiding the tab bar when there is a single buffer
  tabpages  = true,  -- Enable/disable current/total tabpages indicator (top right corner)
  closable  = true,  -- Enable/disable close button
  clickable = true,  -- Enables/disable clickable tabs (left-click: go to buffer, middle-click: delete buffer)

  -- Configure icons
  icons =
  {
    buffer_index = true,
    filetype = { enabled = true },

    separtor =
    {
      left  = '',
      right = '',
    },

    modified = { button = ' ' },
    inactive = { button = '' },
    current  = { button = '' },
    pinned   = { button = '󰐃' },
  },

  maximum_padding = 1, -- Sets the maximum padding width with which to surround each tab
  maximum_length = 30, -- Sets the maximum buffer name length.

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name.
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = "Empty buffer",
})
