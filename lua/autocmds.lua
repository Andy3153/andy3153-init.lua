-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Autocommands
--

-- {{{ --Augroups--
augroupc('tab_2spaces')
augroupc('spellcheck')
augroupc('tab_1spaces')
augroupc('latex_fmr')
augroupc('highlight_yank')
augroupc('run_on_save')
augroupc('no_neovide')
augroupc('cursorcolumn')
augroupc('indentline_color')
augroupc('keybinds')
augroupc('lightweight_bg')
-- }}}

-- {{{ Custom tab sizes for specific filetypes
autocmd('FileType',
{
  pattern = { '', 'dockerfile', 'html', 'lua', 'markdown', 'nginx', 'nix', 'none', 'python', 'sh', 'text', 'vim', 'yaml', 'zsh' },
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

-- {{{ Enable spellchecking in specific filetypes
autocmd('FileType',
{
  pattern = { '', 'markdown', 'plaintex', 'tex', 'text' },
  group   = 'spellcheck',
  command = 'setlocal spell spelllang=en_us,ro'
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
--[[autocmd('BufWritePre',
{
  pattern = '*',
  group   = 'run_on_save',
  command = ':lua insertModeline()'
})]]
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
  group   = 'indentline_color',
  command = 'highlight! link IndentBlanklineChar Comment'
})
-- }}}

if not lightweightMode then
-- {{{ --- Normal mode---
-- {{{ Run :PackerCompile on plugin config change
autocmd('BufWritePost',
{
  pattern = fn.stdpath('config') .. "/lua/plugin_conf/*" ,
  group   = 'run_on_save',
  command = ':PackerCompile'
})
-- }}}

-- {{{ Disable background if Neovide is running
if not g.neovide then
  autocmd('VimEnter',
  {
    pattern = '*',
    group   = 'no_neovide',
    command = 'highlight Normal ctermbg=NONE guibg=NONE'
  })
end
-- }}}

-- {{{ Toggleterm
autocmd('FileType',
{
  pattern = 'toggleterm',
  group   = 'keybinds',
  command = 'tnoremap <buffer> <ESC> <C-\\><C-N> | nnoremap <buffer> <silent> <ESC> :ToggleTerm dir=%:p:h<CR>'
})
-- }}}

-- {{{ Rnvimr
autocmd('FileType',
{
  pattern = 'rnvimr',
  group   = 'keybinds',
  command = 'tnoremap <buffer> <ESC> <C-\\><C-N> | nnoremap <buffer> <silent> <ESC> :RnvimrToggle<CR><CR>'
})
-- }}}
-- }}}
else
-- {{{ --- Lightweight mode---
autocmd('VimEnter',
{
  pattern = '*',
  group   = 'lightweight_bg',
  command = 'highlight Normal ctermbg=NONE guibg=NONE'
})
-- }}}
end
