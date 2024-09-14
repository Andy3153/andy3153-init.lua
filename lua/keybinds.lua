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
nnoremaps('<leader>/',       ':lua clearSearch()<CR>')                             -- Clear search register
nnoremaps('<leader>"',       ':lua clearAllRegisters()<CR>')                       -- Clear all registers
nnoremaps('<leader>\'',      ':lua clearAllMarks()<CR>')                           -- Clear all marks
nnoremaps('<leader>:',       ':<C-f>')                                             -- Open command in editor
nnoremaps('<leader>cd',      ':cd %:p:h | pwd<CR>')                                -- Go in file's current folder
-- }}}

-- {{{ Splits
nnoremap( '<A-(>',           '<C-w><C-v>')                                         -- Vertical split
nnoremap( '<A-)>',           '<C-w><C-s>')                                         -- Horizontal split
nnoremap( '<A-h>',           '<C-w><C-h>')                                         -- To split on left
nnoremap( '<A-j>',           '<C-w><C-j>')                                         -- To split below
nnoremap( '<A-k>',           '<C-w><C-k>')                                         -- To split above
nnoremap( '<A-l>',           '<C-w><C-l>')                                         -- To split on right
nnoremap( '<A-=>',           '<C-w><C-=>')                                         -- Resize splits equally

nnoremap( '<leader>(',       '<C-w><C-v>')                                         -- Vertical split
nnoremap( '<leader>)',       '<C-w><C-s>')                                         -- Horizontal split
nnoremap( '<leader>h',       '<C-w><C-h>')                                         -- To split on left
nnoremap( '<leader>j',       '<C-w><C-j>')                                         -- To split below
nnoremap( '<leader>k',       '<C-w><C-k>')                                         -- To split above
nnoremap( '<leader>l',       '<C-w><C-l>')                                         -- To split on right
nnoremap( '<leader>=',       '<C-w><C-=>')                                         -- Resize splits equally
-- }}}

-- {{{ GUI editors
nnoremaps('<C-=>',           ':lua ResizeGuiFont(1)<CR>')                          -- Increase GUI font size
nnoremaps('<C-->',           ':lua ResizeGuiFont(-1)<CR>')                         -- Decrease GUI font size
nnoremaps('<C-BS>',          ':lua ResetGuiFont()<CR>')                            -- Reset GUI font size
-- }}}

-- {{{ Quality of life improvements
vnoremaps('<', '<gv')                                                              -- Keep selection enabled when using << , >>
vnoremaps('>', '>gv')                                                              -- [...]
vnoremaps('p', '"_dP')                                                             -- Keep same text in yank register when putting over some text
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
nnoremaps('<leader>w',       ':ToggleTerm direction=horizontal dir=%:p:h<CR>'
                          .. ':NvimTreeToggle<CR>'
                          .. '<C-w><C-l>')                                         -- IDE mode
-- }}}

-- {{{ Splits
nnoremaps('<C-A-h>',         ':WinShift left<CR>')                                 -- Move split to left
nnoremaps('<C-A-j>',         ':WinShift down<CR>')                                 -- Move split below
nnoremaps('<C-A-k>',         ':WinShift up<CR>')                                   -- Move split above
nnoremaps('<C-A-l>',         ':WinShift right<CR>')                                -- Move split to right
nnoremaps('<A-H>',         ':lua require("smart-splits").resize_left()<CR>')     -- Resize split to left
nnoremaps('<A-J>',         ':lua require("smart-splits").resize_down()<CR>')     -- Resize split below
nnoremaps('<A-K>',         ':lua require("smart-splits").resize_up()<CR>')       -- Resize split above
nnoremaps('<A-L>',         ':lua require("smart-splits").resize_right()<CR>')    -- Resize split to right

nnoremaps('<leader><C-h>',   ':WinShift left<CR>')                                 -- Move split to left
nnoremaps('<leader><C-j>',   ':WinShift down<CR>')                                 -- Move split below
nnoremaps('<leader><C-k>',   ':WinShift up<CR>')                                   -- Move split above
nnoremaps('<leader><C-l>',   ':WinShift right<CR>')                                -- Move split to right
nnoremaps('<leader>H',       ':lua require("smart-splits").resize_left()<CR>')     -- Resize split to left
nnoremaps('<leader>J',       ':lua require("smart-splits").resize_down()<CR>')     -- Resize split below
nnoremaps('<leader>K',       ':lua require("smart-splits").resize_up()<CR>')       -- Resize split above
nnoremaps('<leader>L',       ':lua require("smart-splits").resize_right()<CR>')    -- Resize split to right
-- }}}

-- {{{ Buffers
nnoremaps('<A-.>',           ':BufferNext<CR>')                                    -- To next tab
nnoremaps('<A-,>',           ':BufferPrevious<CR>')                                -- To previous tab
nnoremaps('<A->>',           ':BufferMoveNext<CR>')                                -- Move tab to left
nnoremaps('<A-<>',           ':BufferMovePrevious<CR>')                            -- Move tab to right
nnoremaps('<A-x>',           ':BufferClose<CR>')                                   -- Close buffer
nnoremaps('<A-X>',           ':BufferClose!<CR>')                                  -- Close buffer without saving

nnoremaps('<leader>.',       ':BufferNext<CR>')                                    -- To next tab
nnoremaps('<leader>,',       ':BufferPrevious<CR>')                                -- To previous tab
nnoremaps('<leader>>',       ':BufferMoveNext<CR>')                                -- Move tab to left
nnoremaps('<leader><',       ':BufferMovePrevious<CR>')                            -- Move tab to right
nnoremaps('<leader>x',       ':BufferClose<CR>')                                   -- Close buffer
nnoremaps('<leader>X',       ':BufferClose!<CR>')                                  -- Close buffer without saving

for i = 1,9,1 do
  nnoremaps('<A-' .. i .. '>', ':BufferGoto ' .. i .. '<CR>')                      -- Go to buffers 1..9
  nnoremaps('<leader>' .. i, ':BufferGoto ' .. i .. '<CR>')                        -- Go to buffers 1..9
end
-- }}}

-- {{{ nvim-tree
nnoremaps('<A-e>',           ':NvimTreeToggle<CR>')                                -- Toggle nvim-tree
tnoremaps('<A-e>',           '<C-\\><C-n>:NvimTreeToggle<CR>')                     -- [...]
nnoremaps('<A-S-e>',         ':NvimTreeFocus<CR>')                                 -- Focus nvim-tree
tnoremaps('<A-S-e>',         '<C-\\><C-n>:NvimTreeFocus<CR>')                      -- [...]

nnoremaps('<leader>e',       ':NvimTreeToggle<CR>')                                -- Toggle nvim-tree
tnoremaps('<leader>e',       '<C-\\><C-n>:NvimTreeToggle<CR>')                     -- [...]
nnoremaps('<leader>E',       ':NvimTreeFocus<CR>')                                 -- Focus  nvim-tree
tnoremaps('<leader>E',       '<C-\\><C-n>:NvimTreeFocus<CR>')                      -- [...]
-- }}}

-- {{{ ToggleTerm
nnoremaps('<A-t>',           ':ToggleTerm direction=horizontal dir=%:p:h<CR>')     -- Toggle horizontal terminal
nnoremaps('<A-S-t>',         ':ToggleTerm direction=float dir=%:p:h<CR>')          -- Toggle floating terminal
nnoremaps('<leader>t',       ':ToggleTerm direction=horizontal dir=%:p:h<CR>')     -- Toggle horizontal terminal
nnoremaps('<leader>T',       ':ToggleTerm direction=float dir=%:p:h<CR>')          -- Toggle floating terminal
-- }}}

-- {{{ Code interactions w/ LSP, Treesitter
nnoremaps('<leader>dd',      ':Trouble diagnostics toggle<CR>')                    -- Trouble diagnostics
nnoremaps('<leader>ds',      ':Trouble symbols toggle<CR>')                        -- Trouble symbols

nnoremaps('<leader>dv',      ':Telescope treesitter<CR>')                          -- Telescope variables

nnoremaps('<leader>dc',      ':Lspsaga code_action<CR>')                           -- Lspsaga code actions
nnoremaps('<leader>dh',      ':Lspsaga hover_doc<CR>')                             -- Lspsaga code actions
nnoremaps('<leader>dr',      ':Lspsaga rename<CR>')                                -- Lspsaga rename
nnoremaps('<leader>dR',      ':Lspsaga lsp_rename ++project<CR>')                  -- Lspsaga rename language symbols
-- }}}

-- {{{ Telescope
nnoremaps('<leader><space>', ':Telescope oldfiles hidden=true<CR>')                -- Telescope recent files
nnoremaps('<leader>fo',      ':Telescope oldfiles hidden=true<CR>')                -- [...]
nnoremaps('<leader>ff',      ':Telescope find_files hidden=true<CR>')              -- Telescope file browser
nnoremaps('<leader>fg',      ':Telescope live_grep<CR>')                           -- Telescope search through files in pwd
nnoremaps('<leader>fb',      ':Telescope buffers<CR>')                             -- Telescope buffers
nnoremaps('<leader>fh',      ':Telescope help_tags<CR>')                           -- Telescope helpfiles
nnoremaps('<leader>fv',      ':Telescope treesitter<CR>')                          -- Telescope Treesitter (show vars, functions etc)
nnoremaps('<leader>f/',      ':Telescope current_buffer_fuzzy_find<CR>')           -- Telescope fuzzy finder
nnoremaps('<leader>fs',      ':Telescope spell_suggest<CR>')                       -- Telescope spell checker suggestions
-- }}}

-- {{{ Session Lens & Auto Session
nnoremaps('<leader>ss',      ':SessionSearch<CR>')                                 -- Open session searcher
nnoremaps('<leader>sp',      ':cd %:p:h | SessionSave<CR>')                        -- Save session
-- }}}

-- {{{ Lazy.nvim
nnoremaps('<leader>pp',      ':Lazy<CR>')                                          -- Plugin manager
nnoremaps('<leader>pu',      ':Lazy update<CR>')                                   -- Plugin update
-- }}}

-- {{{ compiler.nvim
nnoremaps('<F6>',            ':CompilerOpen<CR>')                                  -- Open compiler
nnoremaps('<S-F6>',          ':CompilerStop<CR>'
                          .. ':CompilerRedo<CR>')                                  -- Restart compiler
nnoremaps('<F7>',            ':CompilerToggleResults<CR>')                         -- Show compiler results
-- }}}

-- {{{ Alpha
nnoremaps('<A-n>',           ':Alpha<CR>')                                         -- Open homepage
nnoremaps('<leader>n',       ':Alpha<CR>')                                         -- [...]
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
nmap(     'k',               '<Plug>(accelerated_jk_k)')                           -- Move up faster when holding
nmap(     'j',               '<Plug>(accelerated_jk_j)')                           -- Move down faster when holding
-- }}}
-- }}}
else
-- {{{ --- Lightweight mode---
-- {{{ Splits
nnoremaps('<C-A-h>',         '<C-w><C-H>')                                         -- Move split to left
nnoremaps('<C-A-j>',         '<C-w><C-J>')                                         -- Move split below
nnoremaps('<C-A-k>',         '<C-w><C-K>')                                         -- Move split above
nnoremaps('<C-A-l>',         '<C-w><C-L>')                                         -- Move split to right
nnoremaps('<A-H>',           '2<C-w><')                                            -- Resize split to left
nnoremaps('<A-J>',           '2<C-w>+')                                            -- Resize split below
nnoremaps('<A-K>',           '2<C-w>-')                                            -- Resize split above
nnoremaps('<A-L>',           '2<C-w>>')                                            -- Resize split to right

nnoremaps('<leader>sh',      '<C-w><C-H>')                                         -- Move split to left
nnoremaps('<leader>sj',      '<C-w><C-J>')                                         -- Move split below
nnoremaps('<leader>sk',      '<C-w><C-K>')                                         -- Move split above
nnoremaps('<leader>sl',      '<C-w><C-L>')                                         -- Move split to right
nnoremaps('<leader>H',       '2<C-w><')                                            -- Resize split to left
nnoremaps('<leader>J',       '2<C-w>+')                                            -- Resize split below
nnoremaps('<leader>K',       '2<C-w>-')                                            -- Resize split above
nnoremaps('<leader>L',       '2<C-w>>')                                            -- Resize split to right
-- }}}
-- }}}
end
