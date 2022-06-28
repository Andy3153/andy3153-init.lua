-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Keybinds
--

-- {{{ Basic keybinds
  nnoremap( 'U',          '<C-r>')                                              -- Undo
  tnoremap( '<ESC><ESC>', '<C-\\><C-N>')                                        -- Normal mode in :term
  nnoremap( '<SPACE>',    '<Nop>')                                              -- Unbind space key
  g.mapleader = '\\'                                                            -- Set Leader key
  nmap(     '<SPACE>',    '<leader>')                                           -- Set secondary normal mode Leader key
 -- }}}

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
