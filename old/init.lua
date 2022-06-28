-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- init.lua by Andy3153
-- created   02/06/22 ~ 19:24:15
--

-- {{{ Variables
  -- {{{ Neovim function shorthands
  api     = vim.api
  augroup = api.nvim_create_augroup
  autocmd = api.nvim_create_autocmd
  cmd     = vim.cmd
  fn      = vim.fn
  g       = vim.g
  map     = api.nvim_set_keymap
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
    'alpha',
    'FTerm',
    'help',
    'lsp-installer',
    'lspinfo',
    'nvchad_cheatsheet',
    'packer',
    'prompt',
    'rnvimr',
    'startify',
    'TelescopePrompt',
    'TelescopePrompt',
    'TelescopeResults',
    'terminal',
    'vim-plug',
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
    'marksman',
    'pylsp',
    'sumneko_lua',
    'texlab',
    'vimls'
  }
  -- }}}
-- }}}

-- {{{ Basic settings
  local options =                     -- Option list
  {
    number         = true,            -- Line numbering
    relativenumber = true,            -- Relative line numbering
    compatible     = false,           -- Disable Vi compatibility
    mouse          = 'a',             -- Enable mouse support
    showmode       = false,           -- Disable default mode showing since we use a statusbar
    shellcmdflag   = '-ic',           -- Make shell interactive
    cursorline     = true,            -- Highlight current line
    cursorcolumn   = true,            -- Highlight current column
    undofile       = true,            -- Undo persistence
    showmatch      = true,            -- Show matching bracket
    incsearch      = true,            -- Starts searching as soon as typing
    ignorecase     = true,            -- Ignore letter case when searching
    smartcase      = true,            -- Case insentive unless capitals used in search
    termguicolors  = true,            -- Required by nvim-colorizer
    foldmethod     = 'marker',        -- Fold code
    foldlevel      = 0,               -- Keep folds closed
    signcolumn     = 'yes',           -- Keep signcolumn always on
    splitbelow     = true,            -- Open split below
    splitright     = true,            -- Open vsplit on right
    linebreak      = true,            -- Break lines at spaces
    modeline       = true,            -- Enable modelines
    showcmd        = true,            -- Shows commands
    list           = true,            -- Enable showing special characters
    listchars      = 'trail:·',       -- Special characters to show
    textwidth      = 0,               -- Length after which text should be broken into newlines
    title          = true,            -- Use titlestring as title of window
    titlestring    = '%f',            -- Window title
    tabstop        = 4,               -- Length of <TAB>
    shiftwidth     = 0,               -- Length when shifting text (<<, >> and == commands) (0 for ‘tabstop’)
    softtabstop    = 0,               -- Length when editing text (0 for ‘tabstop’, -1 for ‘shiftwidth’)
    shiftround     = true,            -- Round indentation to multiples of 'shiftwidth',when shifting text
    expandtab      = true,            -- Use spaces instead of <TAB>
    autoindent     = true,            -- Reproduce the indentation of the previous line
    smartindent    = true,            -- Increase the indenting level after ‘{’, decrease it after ‘}’
  }

  opt.clipboard:append('unnamedplus') -- Use system clipboard (REQUIRES xclip or wl-clipboard)

  -- Setting the options in the array
  for key, value in pairs(options) do
    opt[key] = value
  end
-- }}}

-- {{{ Keybinds
  nnoremap( 'U',          '<C-r>')                                              -- Undo
  tnoremap( '<ESC><ESC>', '<C-\\><C-N>')                                        -- Normal mode in :term
  nnoremap( '<SPACE>',    '<Nop>')                                              -- Unbind space key
  g.mapleader = '\\'                                                            -- Set Leader key
  nmap(     '<SPACE>',    '<leader>')                                           -- Set secondary normal mode Leader key

-- {{{ Leader key keybinds
  nnoremaps('<leader>e',  ':Jaq<CR>')                                           -- Jaq    (<leader>e; `E` from "Execute")
  nnoremaps('<leader>r',  ':RnvimrToggle<CR>')                                  -- Rnvimr (<leader>r; `R` from "Ranger")
  tnoremaps('<leader>r',  '<C-\\><C-n>:RnvimrToggle<CR>')                       -- [...]
  nnoremaps('<leader>t',  ':lua require("FTerm").toggle()<CR>')                 -- FTerm  (<leader>t; `T` from "Terminal")
  tnoremaps('<leader>t',  '<C-n>:lua require("FTerm").toggle()<CR>')            -- [...]
  nnoremaps('<leader>n',  ':Alpha<CR>')                                         -- Alpha (homepage)
  nnoremaps('<leader>m',  ':lua insertModeline()<CR>')                          -- Insert modeline in file
  nnoremaps('<leader>/',  ':lua clearSearch()<CR>' )                            -- Clear search register
  nnoremaps('<leader>"',  ':lua clearAllRegisters()<CR>' )                      -- Clear all registers
  nnoremaps('<leader>\'', ':lua clearAllMarks()<CR>' )                          -- Clear all marks
  nnoremaps('<leader>:',  ':<C-f>')                                             -- Open command in editor
  nnoremaps('<leader>;',  ':<C-f>')                                             -- [...]
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

-- {{{ Neovide
  nnoremaps('<C-=>',      ':lua ResizeGuiFont(1)<CR>')
  nnoremaps('<C-->',      ':lua ResizeGuiFont(-1)<CR>')
  nnoremaps('<C-BS>',     ':lua ResetGuiFont()<CR>')
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

-- {{{ Autocmds
  -- {{{ --Augroups--
  augroupc('tab_2spaces')
  augroupc('tab_1spaces')
  augroupc('latex_fmr')
  augroupc('highlight_yank')
  augroupc('run_on_save')
  augroupc('no_neovide')
  augroupc('cursorcolumn')
  augroupc('indentblanklinechar_color')
  -- }}}

  -- {{{ Custom tab sizes for specific filetypes
  autocmd('FileType',
  {
    pattern = { '', 'html', 'lua', 'markdown', 'nginx', 'none', 'python', 'sh', 'text', 'vim', 'yaml', 'zsh' },
    group   = 'tab_2spaces',
    command = 'setlocal tabstop=2 shiftwidth=0 softtabstop=0'
  })

  autocmd('FileType',
  {
    pattern = { 'cdrtoc', 'plaintex', 'tex' },
    group   = 'tab_1spaces',
    command = 'setlocal tabstop=1 shiftwidth=0 softtabstop=0'
  })
  -- }}}

  -- {{{ Custom foldmarker for LaTeX
  autocmd('FileType',
  {
    pattern = { 'cdrtoc', 'plaintex', 'tex' },
    group   = 'latex_fmr',
    command = 'setlocal foldmarker=<<<,>>>'
  })
  -- }}}

  -- {{{ Highlight yanks
  autocmd('TextYankPost',
  {
    pattern = '*',
    group   = 'highlight_yank',
    command = 'silent! lua vim.highlight.on_yank{ higroup="IncSearch", timeout=200 }'
  })
  -- }}}

  -- {{{ Delete trailing spaces on save
  autocmd('BufWritePre',
  {
    pattern = '*',
    group   = 'run_on_save',
    command = ':%s/\\s\\+$//e'
  })
  -- }}}

  -- {{{ Add modeline on save
  autocmd('BufWritePre',
  {
    pattern = '*',
    group   = 'run_on_save',
    command = ':lua insertModeline()'
  })
  -- }}}

  -- {{{ Disable background if Neovide is running
  if not g.neovide then
    autocmd('VimEnter',
    {
      pattern = '*',
      group   = 'no_neovide',
      command = 'highlight  Normal ctermbg=NONE guibg=NONE'
    })
  end
  -- }}}

  -- {{{ Use same color for cursor line and cursor column
  autocmd('VimEnter',
  {
    pattern = '*',
    group   = 'cursorcolumn',
    command = 'highlight! link CursorColumn CursorLine'
  })
  -- }}}

  -- {{{ Use comment color for indent lines
  autocmd('VimEnter',
  {
    pattern = '*',
    group   = 'indentblanklinechar_color',
    command = 'highlight! link IndentBlanklineChar Comment'
  })
  -- }}}
-- }}}

-- {{{ Functions
-- {{{ Modeline
  -- {{{ Generate modeline
  function generateModeline()
    local commentString    = opt.commentstring:get()                   -- Get commentstring for current filetype
    local spaceIfNeeded    = ""
    local fileencoding

    -- Use UTF-8 if no fileencoding is set
    if(opt.fileencoding:get() == "") then
      fileencoding = "utf-8"
    else
      fileencoding = opt.fileencoding:get()
    end

    -- Insert space at the end of the modeline if commentstring is a blockcomment
    if(string.match(commentString, "%%s(.*)") ~= "") then
      spaceIfNeeded = " "
    end

    local modelineElements =                                           -- Settings to save inside the modeline
    {
      " vim: set",
      " fenc=" .. fileencoding,
      " ts="   .. opt.tabstop:get(),
      " sw="   .. opt.shiftwidth:get(),
      " sts="  .. opt.softtabstop:get(),
      " sr",
      " et",
      " si",
      " tw="   .. opt.textwidth:get(),
      " fdm="  .. opt.foldmethod:get(),
      " fmr="  .. opt.foldmarker:get()[1] .. "," .. opt.foldmarker:get()[2],
      ":",
      spaceIfNeeded,
    }

    local modelineConcat   = table.concat(modelineElements)            -- Concatenate the table values
    local modeline         = commentString:gsub("%%s", modelineConcat) -- Place modeline in commentstring correctly

    return modeline
  end
  -- }}}

  -- {{{ Insert modeline in buffer
  function insertModeline()
    local modeline    = generateModeline()                             -- Generate modeline
    local buffer      = api.nvim_win_get_buf(0)                        -- Get current buffer
    local currentLine = api.nvim_buf_get_lines(buffer, 0, 1, true)[1]  -- Get current first line to check

    if(currentLine == modeline) then
      -- if modeline exists (nothing)
    elseif(string.match(currentLine, "vim:")) then
      -- if different modeline exists
      api.nvim_buf_set_lines(0, 0, 1, true, { modeline })
      print("Changed modeline.")

    else
      -- if modeline doesn't exist
      api.nvim_buf_set_lines(0, 0, 0, true, { modeline })
      print("Inserted modeline.")
    end
  end
  -- }}}
-- }}}

-- {{{ Clear search register
function clearSearch()
  fn.setreg('/', {})
  print("Search cleared.")
end
-- }}}

-- {{{ Clear all registers
function clearAllRegisters()
  local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*+'

  registers:gsub('.', function(register) -- take all chars and run them against the command
    fn.setreg(register, {})
  end)

  print("All registers have been cleared.")
end
-- }}}

-- {{{ Clear all marks
function clearAllMarks()
  cmd[[ delmarks! | delmarks a-zA-Z0-9 ]]

  print("All marks have been cleared.")
end
-- }}}
-- }}}

-- {{{ Things still in Vimscript
  cmd
  [[
    "syntax on                " Make sure syntax highlighting is on by default

    filetype plugin indent on " Use language‐specific plugins for indenting

    " Colorscheme
    try
      colorscheme catppuccin
    catch
    endtry

    " Abbreviations
    " Make 'w' and 'q' case insensitive
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))

    " Make help window open on the right
    cnoreabbrev h vert help
    cnoreabbrev help vert help
  ]]
-- }}}

-- {{{ Plugins
  require('plugins')
-- }}}
