-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Autocommands
--

-- {{{ --Augroups--
  augroupc('tab_2spaces')
  augroupc('tab_1spaces')
  augroupc('latex_fmr')
  augroupc('highlight_yank')
  augroupc('run_on_save')
  augroupc('no_neovide')
  augroupc('cursorcolumn')
  augroupc('indentline_color')
  --augroupc('init_lua')
  augroupc('keybinds')
-- }}}

-- {{{ Custom tab sizes for specific filetypes
  autocmd('FileType',
  {
    pattern = { '', 'dockerfile', 'html', 'lua', 'markdown', 'nginx', 'none', 'python', 'sh', 'text', 'vim', 'yaml', 'zsh' },
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
  --[[autocmd('BufWritePre',
  {
    pattern = '*',
    group   = 'run_on_save',
    command = ':lua insertModeline()'
  })]]
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
    group   = 'indentline_color',
    command = 'highlight! link IndentBlanklineChar Comment'
  })
-- }}}

-- {{{ For init.lua
  --[[-- Add the lua folder to the path
  autocmd('BufReadPost',
  {
    pattern = 'init.lua',
    group   = 'init_lua',
    command = 'setlocal path+=./lua'
  })

  -- Add modeline element
  autocmd('BufReadPost',
  {
    pattern = 'init.lua',
    group   = 'init_lua',
    command = 'lua customModelineElements = customModelineElements .. " pa+=./lua"'
  })]]
-- }}}

-- {{{ Keybinds for specific plugins
  -- {{{ Toggleterm
      autocmd('FileType',
      {
        pattern = 'toggleterm',
        group   = 'keybinds',
        command = 'tnoremap <buffer> <ESC> <C-\\><C-N> | nnoremap <buffer> <ESC> :ToggleTerm dir=%:p:h<CR>'
      })
  -- }}}
-- }}}
