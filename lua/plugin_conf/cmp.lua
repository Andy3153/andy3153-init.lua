--  vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
--
-- nvim-cmp configuration
--

-- {{{ Variables
local cmp = require('cmp')
local luasnip = require('luasnip')
-- }}}

-- {{{ Setup
cmp.setup(
{
  -- {{{ Snippets
  snippet =
  {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- }}}

  -- {{{ Sources
  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'vimtex' },
    { name = 'path' },
    { name = 'calc' },
    {
      name = 'latex_symbols',
      option = { strategy = 1 }
    },
    { name = 'emoji' },
    { name = 'buffer' }
  }),
  -- }}}

  -- {{{ Format
  formatting =
  {
    format = require('lspkind').cmp_format(
    {
      mode = "symbol_text",
      menu = (
      {
        nvim_lsp      = "[LSP]",
        luasnip       = "[LuaSnip]",
        vimtex        = "[VimTeX]",
        path          = "[Path]",
        calc          = "[Calc]",
        latex_symbols = "[LaTeX]",
        emoji         = "[Emoji]",
        buffer        = "[Buffer]",
      })
    }),
  },
  -- }}}

  -- {{{ Keymaps
  mapping =
  {
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-c>']     = cmp.mapping.close(),
    ['<C-u>']     = cmp.mapping.scroll_docs(-4),
    ['<C-d>']     = cmp.mapping.scroll_docs(4),
    ['<CR>']      = cmp.mapping.confirm({
      behavior    = cmp.ConfirmBehavior.Replace,
      select      = false,
    }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"}),
  }
  -- }}}
})

-- {{{ Command line setup
-- Search
cmp.setup.cmdline('/',
{
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})

-- Commands
cmp.setup.cmdline(':',
{
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  {
    { name = 'path' }
  },
  {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})
-- }}}
-- }}}

-- {{{ Events
cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
-- }}}

-- {{{ Configure with LSP
for _, lsp in ipairs(lspservers_to_install) do
  require('lspconfig')[lsp].setup(
  {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  })
end
-- }}}
