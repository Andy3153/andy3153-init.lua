"" vim:fileencoding=utf-8:foldmethod=marker
""
"" plugins.vim by Andy3153
"" created   30/01/21 ~ 15:15:49
"" modified  26/04/22 ~ 14:38:02
""

" {{{ Bootstrap the package manager
  if empty(glob('$AUTOLOAD_FOLDER/plug.vim'))
    " Download vim-plug
    echo "Downloading vim-plug package manager..."
    silent !curl -fLo $AUTOLOAD_FOLDER/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !touch $AUTOLOAD_FOLDER/.setup-needed
    autocmd VimEnter * q
  endif
" }}}

" {{{ Plugin list
  call plug#begin('$NVIM_DATA_FOLDER/site/autoload/plugged')
    Plug 'nvim-lua/plenary.nvim'                                   " Extra Lua functions
    Plug 'kyazdani42/nvim-web-devicons'                            " Icons
    Plug 'nvim-lualine/lualine.nvim'                               " Statusline
    Plug 'romgrk/barbar.nvim'                                      " Tab bar
    Plug 'numToStr/FTerm.nvim'                                     " Terminal
    Plug 'kevinhwang91/rnvimr'                                     " File manager
    Plug 'is0n/jaq-nvim'                                           " Quick-run code
    Plug 'petertriho/nvim-scrollbar'                               " Scrollbar
    Plug 'yamatsum/nvim-cursorline'                                " Underline similar stuff
    Plug 'farmergreg/vim-lastplace'                                " Remember last place in file
    Plug 'windwp/nvim-autopairs'                                   " Bracket matching/pairing
    Plug 'andymass/vim-matchup'                                    " Better '%'
    Plug 'numToStr/Comment.nvim'                                   " Commands to comment text
    Plug 'lukas-reineke/indent-blankline.nvim'                     " Indent lines
    Plug 'norcalli/nvim-colorizer.lua'                             " Render colors present in text
    Plug 'goolord/alpha-nvim'                                      " Start screen
    Plug 'andweeb/presence.nvim'                                   " Discord Rich Presence (yes, really)
    Plug 'booperlv/nvim-gomove'                                    " Move selection in file
    Plug 'folke/which-key.nvim'                                    " Keybind tooltips
    Plug 'rhysd/accelerated-jk'                                    " Repeat jk movements
    Plug 'mrjones2014/smart-splits.nvim'                           " Better split resize
    Plug 'sindrets/winshift.nvim'                                  " Better split move
    Plug 'lervag/vimtex'                                           " LaTeX support
    Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(0)}}  " Neovim in browser
    Plug 'nvim-treesitter/nvim-treesitter' ", {'do': ':TSUpdate'}    Better syntax highlighting
    Plug 'neovim/nvim-lspconfig'                                   " LSP server configuration
    Plug 'williamboman/nvim-lsp-installer'                         " LSP installer
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}                      " Tab completion
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}           " 9k+ snippets
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}                 " third party sources

    "Plug 'arcticicestudio/nord-vim'                               " Nord
    "Plug 'fneu/breezy'                                            " Breeze Dark
    "Plug 'dracula/vim', { 'as': 'dracula' }                       " Dracula
    "Plug 'morhetz/gruvbox'                                        " Gruvbox
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}                   " Catppuccin
  call plug#end()
" }}}

" {{{ Install plugins and plugin dependencies after bootstrapping
  if empty(glob('$AUTOLOAD_FOLDER/.setup-needed'))
  else
    echo "Installing packages..."
    autocmd VimEnter * PlugInstall

    echo "Installing COQ dependencies..."
    autocmd VimEnter * COQdeps

    echo "Installing Treesitter dependencies..."
    autocmd VimEnter * TSUpdate
    autocmd VimEnter * TSInstall all

    " Confirm that setup has been done
    silent !rm $AUTOLOAD_FOLDER/.setup-needed
  endif
" }}}
