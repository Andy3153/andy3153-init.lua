-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Vim options
--

-- {{{ Options array
local options =                     -- Option list
{
  number         = true,                   -- Line numbering
  relativenumber = true,                   -- Relative line numbering
  compatible     = false,                  -- Disable Vi compatibility
  mouse          = 'a',                    -- Enable mouse support
  showmode       = false,                  -- Disable default mode showing since we use a statusbar
  shellcmdflag   = '-ic',                  -- Make shell interactive
  cursorline     = true,                   -- Highlight current line
  cursorcolumn   = true,                   -- Highlight current column
  undofile       = true,                   -- Undo persistence
  showmatch      = true,                   -- Show matching bracket
  incsearch      = true,                   -- Starts searching as soon as typing
  ignorecase     = true,                   -- Ignore letter case when searching
  smartcase      = true,                   -- Case insentive unless capitals used in search
  termguicolors  = true,                   -- Required by nvim-colorizer
  guifont        = "IosevkaTerm NF:h8.05", -- Font used by GUI Nvim interfaces (ex. Neovide)
  foldmethod     = 'marker',               -- Fold code
  foldlevel      = 0,                      -- Keep folds closed
  signcolumn     = 'yes',                  -- Keep signcolumn always on
  splitbelow     = true,                   -- Open split below
  splitright     = true,                   -- Open vsplit on right
  linebreak      = true,                   -- Break lines at spaces
  modeline       = true,                   -- Enable modelines
  showcmd        = true,                   -- Shows commands
  list           = true,                   -- Enable showing special characters
  listchars      = 'trail:·,tab:>-',       -- Special characters to show
  textwidth      = 0,                      -- Length after which text should be broken into newlines
  title          = true,                   -- Use titlestring as title of window
  titlestring    = '%f',                   -- Window title
  hidden         = true,                   -- Allow hidden buffers
  scrolloff      = 5,                      -- Number of lines to keep visible while scrolling
  tabstop        = 4,                      -- Length of <TAB>
  shiftwidth     = 0,                      -- Length when shifting text (<<, >> and == commands) (0 for ‘tabstop’)
  softtabstop    = 0,                      -- Length when editing text (0 for ‘tabstop’, -1 for ‘shiftwidth’)
  shiftround     = true,                   -- Round indentation to multiples of 'shiftwidth',when shifting text
  expandtab      = true,                   -- Use spaces instead of <TAB>
  autoindent     = true,                   -- Reproduce the indentation of the previous line
  smartindent    = true,                   -- Increase the indenting level after ‘{’, decrease it after ‘}’
}

opt.clipboard:append('unnamedplus')        -- Use system clipboard (REQUIRES xclip or wl-clipboard)
opt.iskeyword:append('-')                  -- Include the '-' character as a character from a word
-- }}}

-- {{{ Setting the options in the array
for key, value in pairs(options) do
  opt[key] = value
end
-- }}}
