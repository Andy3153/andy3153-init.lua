-- vim:fileencoding=utf-8:foldmethod=marker:foldmarker={{{,}}}
--
-- init.lua by Andy3153
-- created   02/06/22 ~ 19:24:15
--

-- {{{ Variables
  -- {{{ Neovim function shorthands
  augroup = vim.api.nvim_create_augroup
  autocmd = vim.api.nvim_create_autocmd
  cmd     = vim.cmd
  fn      = vim.fn
  g       = vim.g
  map     = vim.api.nvim_set_keymap
  opt     = vim.opt
  -- }}}

  -- {{{ Custom functions
  local function nmap(shortcut, command)
    map('n', shortcut, command, {})
  end

  local function nnoremap(shortcut, command)
    map('n', shortcut, command, { noremap = true })
  end

  local function nnoremaps(shortcut, command)
    map('n', shortcut, command, { noremap = true, silent = true })
  end

  local function inoremaps(shortcut, command)
    map('i', shortcut, command, { noremap = true, silent = true })
  end

  local function vnoremaps(shortcut, command)
    map('v', shortcut, command, { noremap = true, silent = true })
  end

  local function tnoremap(shortcut, command)
    map('t', shortcut, command, { noremap = true })
  end

  local function tnoremaps(shortcut, command)
    map('t', shortcut, command, { noremap = true, silent = true })
  end

  local function augroupc(group_name)
    augroup(group_name, { clear = true })
  end
  -- }}}

  -- {{{ Buffertypes to exclude
  buffertypes_to_exclude =
  {
    'help',
    'terminal',
    'alpha',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'nvchad_cheatsheet',
    'lsp-installer',
    'startify',
    'vim-plug',
    'rnvimr',
    'prompt',
    'TelescopePrompt',
    'FTerm'
  }
  -- }}}

  -- {{{ LSP servers to install
  lspservers_to_install =
  {
    'arduino_language_server',
    'bashls',
    'clangd',
    'cmake',
    'dockerls',
    'html',
    'jdtls',
    'pylsp',
    'sumneko_lua',
    'texlab',
    'vimls'
  }
    --'zeta_note'
  -- }}}
-- }}}

-- {{{ Basic settings
  opt.number         = true           -- Line numbering
  opt.relativenumber = true           -- Relative line numbering
  opt.compatible     = false          -- Disable Vi compatibility
  opt.mouse          = 'a'            -- Enable mouse support
  opt.clipboard:append('unnamedplus') -- Use system clipboard (REQUIRES xclip or wl-clipboard)
  opt.showmode       = false          -- Disable default mode showing since we use a statusbar
  opt.shellcmdflag   = '-ic'          -- Make shell interactive
  opt.cursorline     = true           -- Highlight current line
  opt.cursorcolumn   = true           -- Highlight current column
  opt.undofile       = true           -- Undo persistence
  opt.showmatch      = true           -- Show matching bracket
  opt.incsearch      = true           -- Starts searching as soon as typing
  opt.ignorecase     = true           -- Ignore letter case when searching
  opt.smartcase      = true           -- Case insentive unless capitals used in search
  opt.termguicolors  = true           -- Required by nvim-colorizer
  opt.foldmethod     = 'marker'       -- Fold code
  opt.foldlevel      = 99             -- Max nested fold count
  opt.signcolumn     = 'yes'          -- Keep signcolumn always on
  opt.splitbelow     = true           -- Open split below
  opt.splitright     = true           -- Open vsplit on right
  opt.linebreak      = true           -- Break lines at spaces
  opt.modeline       = true           -- Enable modelines
  opt.showcmd        = true           -- Shows commands
-- }}}

-- {{{ Tabbing
  opt.tabstop        = 4              -- Length of <TAB>
  opt.shiftwidth     = 0              -- Length when shifting text (<<, >> and == commands) (0 for ‘tabstop’)
  opt.softtabstop    = 0              -- Length when editing text (0 for ‘tabstop’, -1 for ‘shiftwidth’)
  opt.shiftround     = true           -- Round indentation to multiples of 'shiftwidth' when shifting text
  opt.expandtab      = true           -- Use spaces instead of <TAB>
  opt.autoindent     = true           -- Reproduce the indentation of the previous line
  opt.smartindent    = true           -- Increase the indenting level after ‘{’, decrease it after ‘}’
  cmd("filetype plugin indent on")    -- Use language‐specific plugins for indenting

  -- Custom tab sizes for specific filetypes
  augroupc('tab_2spaces')
  autocmd('FileType',
  {
    pattern = { '', 'html', 'lua', 'markdown', 'nginx', 'none', 'python', 'sh', 'text', 'vim', 'yaml', 'zsh' },
    group   = 'tab_2spaces',
    command = 'setlocal tabstop=2 shiftwidth=0 softtabstop=0'
  })

  augroupc('tab_1spaces')
  autocmd('FileType',
  {
    pattern = { 'cdrtoc', 'plaintex', 'tex' },
    group   = 'tab_1spaces',
    command = 'setlocal tabstop=1 shiftwidth=0 softtabstop=0'
  })
-- }}}

-- {{{ Colorscheme
  --g.colors_name = 'catppuccin' -- Set colorscheme

  -- Disable background if Neovide is running
  if not g.neovide then
    augroupc('no_neovide')
    autocmd('VimEnter',
    {
      pattern = '*',
      group   = 'no_neovide',
      command = 'highlight  Normal ctermbg=NONE guibg=NONE'
    })
  end

  -- Use same color for cursor line and cursor column
  augroupc('cursorcolumn')
  autocmd('VimEnter',
  {
    pattern = '*',
    group   = 'cursorcolumn',
    command = 'highlight! link CursorColumn CursorLine'
  })
-- }}}

-- {{{ Keybinds
  nnoremap( 'U',          '<C-r>')                                              -- Undo
  tnoremap( '<ESC><ESC>', '<C-\\><C-N>')                                        -- Normal mode in :term
  --nnoremap( '<SPACE>',    '<Nop>')                                            -- Leader key stuff 
  g.mapleader = '\\'                                                            -- [...]

-- {{{ Leader key keybinds
  nnoremaps('<leader>e',  ':Jaq<CR>')                                           -- Jaq    (<leader>e; `E` from "Execute")
  nnoremaps('<leader>r',  ':RnvimrToggle<CR>')                                  -- Rnvimr (<leader>r; `R` from "Ranger")
  tnoremaps('<leader>r',  '<C-\\><C-n>:RnvimrToggle<CR>')                       -- [...]
  nnoremaps('<leader>t',  ':lua require("FTerm").toggle()<CR>')                 -- FTerm  (<leader>t; `T` from "Terminal")
  tnoremaps('<leader>t',  '<C-n>:lua require("FTerm").toggle()<CR>')            -- [...]
  nnoremaps('<leader>n',  ':Alpha<CR>')                                         -- Alpha (homepage)
-- }}}

-- {{{ Splits
  nnoremap( '<A-(>',      '<C-w><C-v>')                                         -- Vertical split
  nnoremap( '<A-)>',      '<C-w><C-s>')                                         -- Horizontal split
  nnoremap( '<A-h>',      '<C-w><C-h>')                                         -- To split on left
  nnoremap( '<A-j>',      '<C-w><C-j>')                                         -- To split below
  nnoremap( '<A-k>',      '<C-w><C-k>')                                         -- To split above
  nnoremap( '<A-l>',      '<C-w><C-l>')                                         -- To split on right
  nnoremaps('<C-A-h>',    ':WinShift left<CR>')                                 -- Move split to left
  nnoremaps('<C-A-j>',    ':WinShift down<CR>')                                 -- Move split below
  nnoremaps('<C-A-k>',    ':WinShift up<CR>')                                   -- Move split above
  nnoremaps('<C-A-l>',    ':WinShift right<CR>')                                -- Move split to right
  nnoremaps('<A-H>',      ':lua require("smart-splits").resize_left()<CR>')     -- Resize split to left
  nnoremaps('<A-J>',      ':lua require("smart-splits").resize_down()<CR>')     -- Resize split below
  nnoremaps('<A-K>',      ':lua require("smart-splits").resize_up()<CR>')       -- Resize split above
  nnoremaps('<A-L>',      ':lua require("smart-splits").resize_right()<CR>')    -- Resize split to right
  nnoremap( '<A-=>',      '<C-w><C-=>')                                         -- Resize splits equally
-- }}}

-- {{{ Tabs
  nnoremaps('<A-.>',      ':BufferNext<CR>')                                    -- To next tab
  nnoremaps('<A-,>',      ':BufferPrevious<CR>')                                -- To previous tab
  nnoremaps('<A->>',      ':BufferMoveNext<CR>')                                -- Move tab to left
  nnoremaps('<A-<>',      ':BufferMovePrevious<CR>')                            -- Move tab to right
  nnoremaps('<A-x>',      ':BufferClose<CR>')                                   -- Close buffer
  nnoremaps('<A-q>',      ':BufferClose<CR>')                                   -- [...]
  nnoremaps('<A-X>',      ':BufferClose!<CR>')                                  -- Close buffer without saving
  nnoremaps('<A-Q>',      ':BufferClose!<CR>')                                  -- [...]

  for i = 1,9,1 do
    nnoremaps('<A-' .. i .. '>', ':BufferGoto ' .. i .. '<CR>')                 -- Go to buffers 1..9
  end
-- }}}

-- {{{ Commenting
  nnoremaps('<C-_>',      '<Plug>(comment_toggle_current_linewise)<CR>')        -- Line comment normal
  inoremaps('<C-_>',      '<ESC><Plug>(comment_toggle_current_linewise)<CR>ki') -- Line comment insert
  vnoremaps('<C-_>',      '<Plug>(comment_toggle_blockwise_visual)<CR>')        -- Line comment visual
-- }}}


-- {{{ Jaq    (Alt+E; `E` from "Execute")
  nnoremaps('<A-e>',      ':Jaq<CR>')
-- }}}

-- {{{ Rnvimr (Alt+R; `R` from "Ranger")
  nnoremaps('<A-r>',      ':RnvimrToggle<CR>')
  tnoremaps('<A-r>',      '<C-\\><C-n>:RnvimrToggle<CR>')
-- }}}
  
-- {{{ FTerm  (Alt+T; `T` from "Terminal")
  nnoremaps('<A-t>',      ':lua require("FTerm").toggle()<CR>')
  tnoremaps('<A-t>',      '<C-\\><C-n>:lua require("FTerm").toggle()<CR>')
-- }}}

-- {{{ Alpha  (Alt+N; `N` from "New Tab")
  nnoremaps('<A-n>',      ':Alpha<CR>')
-- }}}

-- {{{ GoMove
  nnoremaps('<S-h>',      '<Plug>GoNSMLeft')                                    -- Move character to left
  nnoremaps('<S-j>',      '<Plug>GoNSMDown')                                    -- Move line below
  nnoremaps('<S-k>',      '<Plug>GoNSMUp')                                      -- Move line above
  nnoremaps('<S-l>',      '<Plug>GoNSMRight')                                   -- Move character to right
  vnoremaps('<S-h>',      '<Plug>GoVSMLeft')                                    -- Move selection to left
  vnoremaps('<S-j>',      '<Plug>GoVSMDown')                                    -- Move selection below
  vnoremaps('<S-k>',      '<Plug>GoVSMUp')                                      -- Move selection above
  vnoremaps('<S-l>',      '<Plug>GoVSMRight')                                   -- Move selection to right
  nnoremaps('<C-h>',      '<Plug>GoNSDLeft')                                    -- Copy character to left
  nnoremaps('<C-j>',      '<Plug>GoNSDDown')                                    -- Copy line below
  nnoremaps('<C-k>',      '<Plug>GoNSDUp')                                      -- Copy line above
  nnoremaps('<C-l>',      '<Plug>GoNSDRight')                                   -- Copy character to right
  vnoremaps('<C-h>',      '<Plug>GoVSDLeft')                                    -- Copy selection to left
  vnoremaps('<C-j>',      '<Plug>GoVSDDown')                                    -- Copy selection below
  vnoremaps('<C-k>',      '<Plug>GoVSDUp')                                      -- Copy selection above
  vnoremaps('<C-l>',      '<Plug>GoVSDRight')                                   -- Copy selection to right
-- }}}

-- {{{ Accelerated-JK
  nmap(     'j',          '<Plug>(accelerated_jk_j)')
  nmap(     'k',          '<Plug>(accelerated_jk_k)')
-- }}}
-- }}}

-- {{{ Others
  -- {{{ Highlight yanks
  augroupc('highlight_yank')
  autocmd('TextYankPost',
  {
    pattern = '*',
    group   = 'highlight_yank',
    command = 'silent! lua vim.highlight.on_yank{ higroup="IncSearch", timeout=200 }'
  })
  -- }}}

  -- {{{ Things still in Vimscript
  cmd
  [[
    "syntax on " Make sure syntax highlighting is on by default

    " Colorscheme
    try
      colorscheme catppuccin
    catch
    endtry

    " Abbreviations
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))
  ]]
  -- }}}
-- }}}

-- {{{ Plugins
  require('plugins')
-- }}}
