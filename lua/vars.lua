-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- Variables & shortened functions
--

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

-- {{{ Functions to mimic Vimscript's functions
function nmap(shortcut, command)
  map('n', shortcut, command, {})
end

function nnoremap(shortcut, command)
  map('n', shortcut, command, { noremap = true })
end

function nnoremaps(shortcut, command)
  map('n', shortcut, command, { noremap = true, silent = true })
end

function inoremaps(shortcut, command)
  map('i', shortcut, command, { noremap = true, silent = true })
end

function vmap(shortcut, command)
  map('v', shortcut, command, {})
end

function vnoremaps(shortcut, command)
  map('v', shortcut, command, { noremap = true, silent = true })
end

function tnoremap(shortcut, command)
  map('t', shortcut, command, { noremap = true })
end

function tnoremaps(shortcut, command)
  map('t', shortcut, command, { noremap = true, silent = true })
end

function augroupc(group_name)
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
  'toggleterm',
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
  'lua_ls',
  'marksman',
  'pylsp',
  'rnix',
  'texlab',
  'vimls'
}
-- }}}
