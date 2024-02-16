-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:

if not lightweightMode then

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]

require('plugin_conf/neovide') -- load Neovide config

return require('packer').startup(function(use)
  use
  {
    'wbthomason/packer.nvim'                                                                  -- Plugin manager
  }

  use
  {
    'nvim-lualine/lualine.nvim',                                                              -- Statusline
    requires = { 'kyazdani42/nvim-web-devicons' },
    config   = function() require('plugin_conf/lualine') end
  }

  use
  {
    'romgrk/barbar.nvim',                                                                     -- Tab bar
    requires = { 'kyazdani42/nvim-web-devicons' },
    config   = function() require('plugin_conf/barbar') end
  }

  use
  {
    'akinsho/toggleterm.nvim',                                                                -- Terminal
    tag      = 'v2.*',
    config   = function() require('plugin_conf/toggleterm') end
  }

  use
  {
    'kevinhwang91/rnvimr',                                                                    -- File manager
    config   = function() require('plugin_conf/rnvimr') end
  }

  use
  {
    'is0n/jaq-nvim',                                                                          -- Quick-run code
    config   = function() require('plugin_conf/jaq') end
  }

  use
  {
    'petertriho/nvim-scrollbar',                                                              -- Scrollbar
    config   = function() require('plugin_conf/scrollbar') end
  }

  use
  {
    'yamatsum/nvim-cursorline',                                                               -- Underline similar stuff
    config   = function() require('plugin_conf/cursorline') end
  }

  use
  {
    'ethanholz/nvim-lastplace'                                                                -- Remember last place in file
  }

  use
  {
    'windwp/nvim-autopairs',                                                                  -- Bracket matching/pairing
    config   = function() require('plugin_conf/autopairs') end
  }

  use
  {
    'andymass/vim-matchup'                                                                    -- Better '%'
  }

  use
  {
    'numToStr/Comment.nvim',                                                                  -- Commands to comment text
    config   = function() require('plugin_conf/comment') end
  }

  use
  {
    'lukas-reineke/indent-blankline.nvim',                                                    -- Indent lines
    config   = function() require('plugin_conf/indent_blankline') end
  }

  use
  {
    'norcalli/nvim-colorizer.lua',                                                            -- Render colors present in text
    config   = function() require('plugin_conf/colorizer') end
  }

  use
  {
    'goolord/alpha-nvim',                                                                     -- Start screen
    requires = { 'kyazdani42/nvim-web-devicons' },
    config   = function() require('plugin_conf/alpha') end
  }

  use
  {
    'andweeb/presence.nvim',                                                                  -- Discord Rich Presence
    config   = function() require('plugin_conf/presence') end
  }

  use
  {
    'booperlv/nvim-gomove',                                                                   -- Move selection in file
    config   = function() require('plugin_conf/gomove') end
  }

  use
  {
    'folke/which-key.nvim',                                                                   -- Keybind tooltips
    config   = function() require('plugin_conf/which-key') end
  }

  use
  {
    'rainbowhxch/accelerated-jk.nvim'                                                         -- Repeat jk movements
  }

  use
  {
    'mrjones2014/smart-splits.nvim'                                                           -- Better split resize
  }

  use
  {
    'sindrets/winshift.nvim'                                                                  -- Better split move
  }

  use
  {
    'lewis6991/gitsigns.nvim',                                                                -- Git signs
    config   = function() require('plugin_conf/gitsigns') end
  }

  use
  {
    'lervag/vimtex',                                                                          -- LaTeX support
    config   = function() require('plugin_conf/vimtex') end
  }

  use
  {
    'tpope/vim-surround'                                                                      -- Surround text in parentheses
  }

  use
  {
    'dhruvasagar/vim-table-mode'                                                              -- Vim table mode
  }

  use
  {
    "iamcco/markdown-preview.nvim",                                                           -- Preview markdown files
    run   = "cd app && npm install",
    ft    = { "markdown" },
    setup = function() g.mkdp_filetypes = { "markdown" } end,
  }

  use
  {
    'gpanders/nvim-parinfer'                                                                  -- Better S-expressions writing
  }

  use
  {
    'nvim-telescope/telescope.nvim',                                                          -- Fuzzy finder
    requires = {'nvim-lua/plenary.nvim'},
    config   = function() require('plugin_conf/telescope') end
  }

  use
  {
    'rmagatti/session-lens',                                                                  -- Session searcher
    requires =
    {
      {
        'rmagatti/auto-session',
        config = function() require('plugin_conf/auto_session') end
      },
      'nvim-telescope/telescope.nvim'
    },
    config   = function() require('plugin_conf/session_lens') end
  }

  use
  {
    'nvim-treesitter/nvim-treesitter',                                                        -- Better syntax highlighting
    run      = ':TSUpdate', --why won't this work
    config   = function() require('plugin_conf/treesitter') end
  }

  use
  {
    'ms-jpq/coq_nvim',                                                                        -- Tab completion
    branch   = 'coq',
    run      = ':COQdeps',
    requires =
    {
      {
        'ms-jpq/coq.artifacts',                                                               -- 9k+ snippets
        branch = 'artifacts'
      },
      {
        'ms-jpq/coq.thirdparty',                                                              -- third party sources
        branch = '3p'
      }
    },
    config   = function() require('plugin_conf/coq') end
  }

  use
  {
    "williamboman/mason.nvim",                                                                -- Mason (LSP server provider)
    run = ":MasonUpdate",
    config   = function() require('plugin_conf/mason') end
  }

  use
  {
    'williamboman/mason-lspconfig.nvim',
    config   = function() require('plugin_conf/mason-lspconfig') end
  }

  use
  {
    'neovim/nvim-lspconfig',                                                                  -- LSP server configuration
    config   = function() require('plugin_conf/mason') require('plugin_conf/lspconfig')  end
  }

  --[[use
  {
    'TaDaa/vimade',                                                                           -- Fade inactive views
    config   = function() require('plugin_conf/vimade') end
  }]]


  --[[use
  {
    'arcticicestudio/nord-vim',                                                               -- Nord
  }]]


  --[[use
  {
    'fneu/breezy',                                                                            -- Breeze Dark
  }]]

  --[[use
  {
    'dracula/vim',                                                                            -- Dracula
    as       = 'dracula'
  }]]

  --[[use
  {
    'morhetz/gruvbox',                                                                        -- Gruvbox
  }]]

  use
  {
    "catppuccin/nvim",                                                                        -- Catppuccin
    as       = "catppuccin",
    config   = function() require('plugin_conf/catppuccin') end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

end
