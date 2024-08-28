-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Keybinds
--

-- {{{ Basic keybinds
nnoremap( 'U',               '<C-r>')                                              -- Undo
nnoremap( '<SPACE>',         '<Nop>')                                              -- Unbind space key
g.mapleader = '\\'                                                                 -- Set Leader key
nmap(     '<SPACE>',         '<leader>')                                           -- Set secondary normal mode Leader key
 -- }}}
-- {{{ Leader key keybinds
nnoremaps('<leader>m',       ':lua insertModeline()<CR>')                          -- Insert modeline in file
nnoremaps('<leader>/',       ':lua clearSearch()<CR>' )                            -- Clear search register
nnoremaps('<leader>"',       ':lua clearAllRegisters()<CR>' )                      -- Clear all registers
nnoremaps('<leader>\'',      ':lua clearAllMarks()<CR>' )                          -- Clear all marks
nnoremaps('<leader>:',       ':<C-f>')                                             -- Open command in editor
nnoremaps('<leader>;',       ':<C-f>')                                             -- [...]
nnoremaps('<leader>cd',      ':cd %:p:h | pwd<CR>')                                -- Go in file's current folder
nnoremaps('<leader>cd~',     ':cd ~ | pwd<CR>')                                    -- Go in homedir
nnoremap( '<leader>(',       '<C-w><C-v>')                                         -- Vertical split
nnoremap( '<leader>)',       '<C-w><C-s>')                                         -- Horizontal split
nnoremap( '<leader>h',       '<C-w><C-h>')                                         -- To split on left
nnoremap( '<leader>j',       '<C-w><C-j>')                                         -- To split below
nnoremap( '<leader>k',       '<C-w><C-k>')                                         -- To split above
nnoremap( '<leader>l',       '<C-w><C-l>')                                         -- To split on right
nnoremap( '<leader>=',       '<C-w><C-=>')                                         -- Resize splits equally
-- }}}
-- {{{ Splits
nnoremap( '<A-(>',           '<C-w><C-v>')                                         -- Vertical split
nnoremap( '<A-)>',           '<C-w><C-s>')                                         -- Horizontal split
nnoremap( '<A-h>',           '<C-w><C-h>')                                         -- To split on left
nnoremap( '<A-j>',           '<C-w><C-j>')                                         -- To split below
nnoremap( '<A-k>',           '<C-w><C-k>')                                         -- To split above
nnoremap( '<A-l>',           '<C-w><C-l>')                                         -- To split on right
nnoremap( '<A-=>',           '<C-w><C-=>')                                         -- Resize splits equally
-- }}}
-- {{{ GUI editors
nnoremaps('<C-=>',           ':lua ResizeGuiFont(1)<CR>')
nnoremaps('<C-->',           ':lua ResizeGuiFont(-1)<CR>')
nnoremaps('<C-BS>',          ':lua ResetGuiFont()<CR>')
-- }}}
-- {{{ Quality of life improvements
vnoremaps('<', '<gv')      -- Keep selection enabled when using << , >>
vnoremaps('>', '>gv')      -- [...]
vnoremaps('p', '"_dP')     -- Keep same text in yank register when putting over some text
-- }}}
-- {{{ Romanian keyboard stuff
nmap(     'ă', '[')
vmap(     'ă', '[')
nmap(     'Ă', '{')
vmap(     'Ă', '{')

nmap(     'î', ']')
vmap(     'î', ']')
nmap(     'Î', '}')
vmap(     'Î', '}')

nmap(     'â', '\\')
vmap(     'â', '\\')
nmap(     'Â', '|')
vmap(     'Â', '|')

nmap(     'ș', ';')
vmap(     'ș', ';')
nmap(     'Ș', ':')
vmap(     'Ș', ':')

nmap(     'ț', '\'')
vmap(     'ț', '\'')
nmap(     'Ț', '"')
vmap(     'Ț', '"')
-- }}}

if not lightweightMode then
-- {{{ --- Normal mode---
-- {{{ Leader key keybinds
--nnoremaps('<leader>r',       ':RnvimrToggle<CR>')                                  -- Rnvimr (<leader>r; `R` from "Ranger")
--tnoremaps('<leader>r',       '<C-\\><C-n>:RnvimrToggle<CR>')                       -- [...]

nnoremaps('<leader>e',       ':NvimTreeToggle<CR>')                                -- nvim-tree (<leader>e; `E` from "Explorer")
tnoremaps('<leader>e',       '<C-\\><C-n>:NvimTreeToggle<CR>')                     -- [...]
nnoremaps('<leader>r',       ':NvimTreeToggle<CR>')
tnoremaps('<leader>r',       '<C-\\><C-n>:NvimTreeToggle<CR>')

nnoremaps('<leader>t',       ':ToggleTerm direction=horizontal dir=%:p:h<CR>')     -- Split terminal
nnoremaps('<leader>T',       ':ToggleTerm direction=float dir=%:p:h<CR>')          -- Floating terminal

nnoremaps('<leader>w',       ':ToggleTerm direction=horizontal dir=%:p:h<CR>'
                          .. ':NvimTreeToggle<CR>'
                          .. '<C-w><C-l>')                                         -- IDE mode

nnoremaps('<leader>n',       ':Alpha<CR>')                                         -- Alpha (homepage)

nnoremaps('<leader><space>', ':Telescope oldfiles hidden=true<CR>')                -- Telescope recent files
nnoremaps('<leader>fo',      ':Telescope oldfiles hidden=true<CR>')                -- [...]
nnoremaps('<leader>ff',      ':Telescope find_files hidden=true<CR>')              -- Telescope file browser
nnoremaps('<leader>fg',      ':Telescope live_grep<CR>')                           -- Telescope search through files in pwd
nnoremaps('<leader>fb',      ':Telescope buffers<CR>')                             -- Telescope buffers
nnoremaps('<leader>fh',      ':Telescope help_tags<CR>')                           -- Telescope helpfiles
nnoremaps('<leader>fm',      ':Telescope man_pages<CR>')                           -- Telescope manpages
nnoremaps('<leader>fgs',     ':Telescope git_status<CR>')                          -- Telescope Git status
nnoremaps('<leader>fv',      ':Telescope treesitter<CR>')                          -- Telescope Treesitter (show vars, functions etc)
nnoremaps('<leader>f/',      ':Telescope current_buffer_fuzzy_find<CR>')           -- Telescope fuzzy finder
nnoremaps('<leader>fs',      ':Telescope spell_suggest<CR>')                       -- Telescope spell checker suggestions

nnoremaps('<leader>ss',      ':SessionSearch<CR>')                                 -- Open session searcher
nnoremaps('<leader>sp',      ':cd %:p:h | SessionSave<CR>')                        -- Save session

nnoremaps('<leader>.',       ':BufferNext<CR>')                                    -- To next tab
nnoremaps('<leader>,',       ':BufferPrevious<CR>')                                -- To previous tab
nnoremaps('<leader>>',       ':BufferMoveNext<CR>')                                -- Move tab to left
nnoremaps('<leader><',       ':BufferMovePrevious<CR>')                            -- Move tab to right
nnoremaps('<leader>x',       ':BufferClose<CR>')                                   -- Close buffer
nnoremaps('<leader>X',       ':BufferClose!<CR>')                                  -- Close buffer without saving

nnoremaps('<leader>sh',      ':WinShift left<CR>')                                 -- Move split to left
nnoremaps('<leader>sj',      ':WinShift down<CR>')                                 -- Move split below
nnoremaps('<leader>sk',      ':WinShift up<CR>')                                   -- Move split above
nnoremaps('<leader>sl',      ':WinShift right<CR>')                                -- Move split to right

nnoremaps('<leader>H',       ':lua require("smart-splits").resize_left()<CR>')     -- Resize split to left
nnoremaps('<leader>J',       ':lua require("smart-splits").resize_down()<CR>')     -- Resize split below
nnoremaps('<leader>K',       ':lua require("smart-splits").resize_up()<CR>')       -- Resize split above
nnoremaps('<leader>L',       ':lua require("smart-splits").resize_right()<CR>')    -- Resize split to right

nnoremaps('<leader>pp',      ':Lazy<CR>')                                          -- Plugin status
nnoremaps('<leader>ps',      ':Lazy sync<CR>')                                     -- Plugin sync
nnoremaps('<leader>pu',      ':Lazy update<CR>')                                   -- Plugin update

for i = 1,9,1 do
  nnoremaps('<leader>' .. i, ':BufferGoto ' .. i .. '<CR>')                      -- Go to buffers 1..9
end
-- }}}
-- {{{ Splits
nnoremaps('<C-A-h>',         ':WinShift left<CR>')                                 -- Move split to left
nnoremaps('<C-A-j>',         ':WinShift down<CR>')                                 -- Move split below
nnoremaps('<C-A-k>',         ':WinShift up<CR>')                                   -- Move split above
nnoremaps('<C-A-l>',         ':WinShift right<CR>')                                -- Move split to right
nnoremaps('<A-H>',           ':lua require("smart-splits").resize_left()<CR>')     -- Resize split to left
nnoremaps('<A-J>',           ':lua require("smart-splits").resize_down()<CR>')     -- Resize split below
nnoremaps('<A-K>',           ':lua require("smart-splits").resize_up()<CR>')       -- Resize split above
nnoremaps('<A-L>',           ':lua require("smart-splits").resize_right()<CR>')    -- Resize split to right
-- }}}
-- {{{ Buffers
nnoremaps('<A-.>',           ':BufferNext<CR>')                                    -- To next tab
nnoremaps('<A-,>',           ':BufferPrevious<CR>')                                -- To previous tab
nnoremaps('<A->>',           ':BufferMoveNext<CR>')                                -- Move tab to left
nnoremaps('<A-<>',           ':BufferMovePrevious<CR>')                            -- Move tab to right
nnoremaps('<A-x>',           ':BufferClose<CR>')                                   -- Close buffer
nnoremaps('<A-q>',           ':BufferClose<CR>')                                   -- [...]
nnoremaps('<A-X>',           ':BufferClose!<CR>')                                  -- Close buffer without saving
nnoremaps('<A-Q>',           ':BufferClose!<CR>')                                  -- [...]

for i = 1,9,1 do
  nnoremaps('<A-' .. i .. '>', ':BufferGoto ' .. i .. '<CR>')                      -- Go to buffers 1..9
end
-- }}}
-- {{{ Commenting
nnoremaps('<C-_>',           '<Plug>(comment_toggle_current_linewise)<CR>')        -- Line comment normal
inoremaps('<C-_>',           '<ESC><Plug>(comment_toggle_current_linewise)<CR>ki') -- Line comment insert
vnoremaps('<C-_>',           '<Plug>(comment_toggle_blockwise_visual)<CR>')        -- Line comment visual
-- }}}
-- {{{ Folds
nnoremaps('<C-_>',           ':lua require(\'ufo\').openAllFolds<CR>')             -- Open all folds
nnoremaps('<C-_>',           ':lua require(\'ufo\').closeAllFolds<CR>')            -- Close all folds
-- }}}
-- {{{ nvim-tree
nnoremaps('<A-r>',           ':NvimTreeToggle<CR>')
tnoremaps('<A-r>',           '<C-\\><C-n>:NvimTreeToggle<CR>')
-- }}}
-- {{{ FTerm
nnoremaps('<A-t>',           ':lua require("FTerm").toggle()<CR>')
tnoremaps('<A-t>',           '<C-\\><C-n>:lua require("FTerm").toggle()<CR>')
-- }}}
-- {{{ compiler.nvim
nnoremaps('<F6>',            ':CompilerOpen<CR>')
nnoremaps('<S-F6>',          ':CompilerStop<CR>'
                          .. ':CompilerRedo<CR>')
nnoremaps('<F7>',            ':CompilerToggleResults<CR>')
-- }}}
-- {{{ Alpha
nnoremaps('<A-n>',           ':Alpha<CR>')
-- }}}
-- {{{ GoMove
nnoremaps('<S-h>',           '<Plug>GoNSMLeft')                                    -- Move character to left
nnoremaps('<S-j>',           '<Plug>GoNSMDown')                                    -- Move line below
nnoremaps('<S-k>',           '<Plug>GoNSMUp')                                      -- Move line above
nnoremaps('<S-l>',           '<Plug>GoNSMRight')                                   -- Move character to right
vnoremaps('<S-h>',           '<Plug>GoVSMLeft')                                    -- Move selection to left
vnoremaps('<S-j>',           '<Plug>GoVSMDown')                                    -- Move selection below
vnoremaps('<S-k>',           '<Plug>GoVSMUp')                                      -- Move selection above
vnoremaps('<S-l>',           '<Plug>GoVSMRight')                                   -- Move selection to right
nnoremaps('<C-h>',           '<Plug>GoNSDLeft')                                    -- Copy character to left
nnoremaps('<C-j>',           '<Plug>GoNSDDown')                                    -- Copy line below
nnoremaps('<C-k>',           '<Plug>GoNSDUp')                                      -- Copy line above
nnoremaps('<C-l>',           '<Plug>GoNSDRight')                                   -- Copy character to right
vnoremaps('<C-h>',           '<Plug>GoVSDLeft')                                    -- Copy selection to left
vnoremaps('<C-j>',           '<Plug>GoVSDDown')                                    -- Copy selection below
vnoremaps('<C-k>',           '<Plug>GoVSDUp')                                      -- Copy selection above
vnoremaps('<C-l>',           '<Plug>GoVSDRight')                                   -- Copy selection to right
-- }}}
-- {{{ Accelerated-JK
nmap(     'j',               '<Plug>(accelerated_jk_j)')
nmap(     'k',               '<Plug>(accelerated_jk_k)')
-- }}}
-- }}}
else
-- {{{ --- Lightweight mode---
-- {{{ Leader key keybinds
nnoremaps('<leader>sh',      '<C-w><C-H>')                                         -- Move split to left
nnoremaps('<leader>sj',      '<C-w><C-J>')                                         -- Move split below
nnoremaps('<leader>sk',      '<C-w><C-K>')                                         -- Move split above
nnoremaps('<leader>sl',      '<C-w><C-L>')                                         -- Move split to right
nnoremaps('<leader>H',       '2<C-w><')                                            -- Resize split to left
nnoremaps('<leader>J',       '2<C-w>+')                                            -- Resize split below
nnoremaps('<leader>K',       '2<C-w>-')                                            -- Resize split above
nnoremaps('<leader>L',       '2<C-w>>')                                            -- Resize split to right
-- }}}
-- {{{ Splits
nnoremaps('<C-A-h>',         '<C-w><C-H>')                                         -- Move split to left
nnoremaps('<C-A-j>',         '<C-w><C-J>')                                         -- Move split below
nnoremaps('<C-A-k>',         '<C-w><C-K>')                                         -- Move split above
nnoremaps('<C-A-l>',         '<C-w><C-L>')                                         -- Move split to right
nnoremaps('<A-H>',           '2<C-w><')                                            -- Resize split to left
nnoremaps('<A-J>',           '2<C-w>+')                                            -- Resize split below
nnoremaps('<A-K>',           '2<C-w>-')                                            -- Resize split above
nnoremaps('<A-L>',           '2<C-w>>')                                            -- Resize split to right
-- }}}
-- }}}
end
