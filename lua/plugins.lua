-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:

if not lightweightMode then

-- {{{ Bootstrap lazy.nvim
local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(install_path) then
  fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', install_path, })
end
vim.opt.rtp:prepend(install_path)
-- }}}

require('plugin_conf/neovide') -- load Neovide config

-- {{{ Plugins
require('lazy').setup(
{
  {
    'nvim-lualine/lualine.nvim',                              -- Statusline
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugin_conf/lualine') end
  },

  {
    'romgrk/barbar.nvim',                                     -- Tab bar
    dependencies =
    {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('plugin_conf/barbar') end
  },

  {
    'nvim-tree/nvim-tree.lua',                                -- File tree
    dependencies =
    {
      {
        'antosha417/nvim-lsp-file-operations',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('lsp-file-operations').setup() end
      },

      'nvim-tree/nvim-web-devicons',
      'JMarkin/nvim-tree.lua-float-preview'
    },

    config = function() require('plugin_conf/nvim-tree') end
  },

  {
    'akinsho/toggleterm.nvim',                                -- Terminal
    config = function() require('plugin_conf/toggleterm') end
  },

  --{
  --  'kevinhwang91/rnvimr',                                    -- File manager
  --  config = function() require('plugin_conf/rnvimr') end
  --},
  --
  {
    'petertriho/nvim-scrollbar',                              -- Scrollbar
    config = function() require('plugin_conf/scrollbar') end
  },

  {
    'yamatsum/nvim-cursorline',                               -- Underline similar stuff
    config = function() require('plugin_conf/cursorline') end
  },

  {
    'windwp/nvim-autopairs',                                  -- Bracket matching/pairing
    config = function() require('plugin_conf/autopairs') end
  },

  {
    'numToStr/Comment.nvim',                                  -- Commands to comment text
    config = function() require('plugin_conf/comment') end
  },

  {
    'lukas-reineke/indent-blankline.nvim',                    -- Indent lines
    config = function() require('plugin_conf/indent_blankline') end
  },

  {
    'norcalli/nvim-colorizer.lua',                            -- Render colors present in text
    config = function() require('plugin_conf/colorizer') end
  },

  {
    'goolord/alpha-nvim',                                     -- Start screen
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config   = function() require('plugin_conf/alpha') end
  },

  {
    'andweeb/presence.nvim',                                  -- Discord Rich Presence
    config = function() require('plugin_conf/presence') end
  },

  {
    'booperlv/nvim-gomove',                                   -- Move selection in file
    config = function() require('plugin_conf/gomove') end
  },

  {
    'folke/which-key.nvim',                                   -- Keybind tooltips
    config = function() require('plugin_conf/which-key') end
  },

  {
    'lewis6991/gitsigns.nvim',                                -- Git signs
    config = function() require('plugin_conf/gitsigns') end
  },

  {
    'lervag/vimtex',                                          -- LaTeX support
    config = function() require('plugin_conf/vimtex') end
  },

  {
    'iamcco/markdown-preview.nvim',                           -- Preview markdown files
    build = 'cd app && yarn install',
    cmd   = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft    = { 'markdown' },
    init  = function() g.mkdp_filetypes = { 'markdown' } end,
  },

  {
    'nvim-telescope/telescope.nvim',                          -- Fuzzy finder
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugin_conf/telescope') end
  },

  {
    'rmagatti/session-lens',                                  -- Session searcher
    dependencies =
    {
      {
        'rmagatti/auto-session',
        config = function() require('plugin_conf/auto_session') end
      },

      'nvim-telescope/telescope.nvim'
    },
    config = function() require('plugin_conf/session_lens') end
  },

  {
    'nvim-treesitter/nvim-treesitter',                        -- Better syntax highlighting
    build  = ':TSUpdate',
    config = function() require('plugin_conf/treesitter') end
  },

  {
    'williamboman/mason.nvim',                                -- Mason (LSP server provider)
    build  = ':MasonUpdate',
    dependencies =
    {
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies =
        {
          {
            'neovim/nvim-lspconfig',                          -- LSP server configuration
            config = function()
                       require('plugin_conf/mason')
                       require('plugin_conf/mason-lspconfig')
                       require('plugin_conf/lspconfig')
                     end
          },
        },
      },
    },
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies =
    {
      "rafamadriz/friendly-snippets"
    },

    config = function() require('plugin_conf/luasnip') end
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies =
    {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'micangl/cmp-vimtex',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'kdheepak/cmp-latex-symbols',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      "onsails/lspkind.nvim",
      'windwp/nvim-autopairs',
    },
    config = function() require('plugin_conf/cmp') end
  },

    'ethanholz/nvim-lastplace',                               -- Remember last place in file
    'andymass/vim-matchup',                                   -- Better '%' key behavior
    'rainbowhxch/accelerated-jk.nvim',                        -- Repeat jk movements
    'mrjones2014/smart-splits.nvim',                          -- Better split resize
    'sindrets/winshift.nvim',                                 -- Better split move
    'tpope/vim-surround',                                     -- Surround text in parentheses
    'dhruvasagar/vim-table-mode',                             -- Vim table mode
    'gpanders/nvim-parinfer',                                 -- Better S-expressions writing

  {
    'catppuccin/nvim',                                        -- Catppuccin
    name     = 'catppuccin',
    lazy     = false,
    priority = 1000,
    config   = function()
                 require('plugin_conf/catppuccin')
                 cmd([[colorscheme catppuccin]])
               end
  },
})
-- }}}
end
