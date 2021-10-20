local use = require('packer').use
return require('packer').startup({function()
  use { 'wbthomason/packer.nvim' }

  -- Color schemes.
  use { 'folke/tokyonight.nvim' }
  use { 'bluz71/vim-nightfly-guicolors' }
  use { 'bluz71/vim-moonfly-colors' }
  use { 'shaunsingh/nord.nvim' }
  use { 'navarasu/onedark.nvim' }
  use { 'wuelnerdotexe/vim-enfocado' }

  -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
  -- when toggled in either of it's three different modes (Ataraxis, Minimalist and Focus).
  use {
    'Pocco81/TrueZen.nvim',
    cmd = {
      'TZFocus',
      'TZAtaraxis',
      'TZMinimalist',
    },
    setup = function()
      require('plugins/true-zen')
    end
}

  -- This plugin adds indentation guides to all lines (including empty lines).
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('plugins/indent-blankline')
    end
  }

  -- This plugin causes all trailing whitespace characters to be highlighted.
  -- TODO: delete this plugin and implement it abilitys
  -- (highlighting and removing whitespaces) in CodeArt
  use { 'ntpeters/vim-better-whitespace' }

  -- Icons.
  use { 'kyazdani42/nvim-web-devicons' }

  -- File explorer tree.
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeOpen',
      'NvimTreeFocus',
      'NvimTreeToggle',
    },
    config = function()
      require('plugins/nvim-tree')
    end
  }

  -- Bufferline.
  use { 'akinsho/nvim-bufferline.lua' }

  -- Statusline.
  -- Moved to this lualine because Main lualine has not get commit from may 27
  -- use { 'hoob3rt/lualine.nvim' }
  use { 'shadmansaleh/lualine.nvim' }

  -- TreeSitter.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    cmd = {
      'TSInstall',
      'TSInstallSync',
      'TSBufEnable',
      'TSBufToggle',
      'TSEnableAll',
      'TSInstallFromGrammer',
      'TSToggleAll',
      'TSUpdate',
      'TSUpdateSync'
    },
    setup = function()
      require('plugins/treesitter')
    end
  }

  -- Colorizer (for highlighting color codes).
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    setup = function()
      require('plugins/colorize')
    end
  }

  -- Startup screen.
  use {
    'glepnir/dashboard-nvim',
    cmd = {
      'Dashboard',
      'DashboardChangeColorscheme',
      'DashboardFindFile',
      'DashboardFindHistory',
      'DashboardFindWord',
      'DashboardNewFile',
      'DashboardJumpMarks',
      'SessionLoad',
      'SessionSave'
    },
    setup = function()
        require('plugins/dashboard')
    end
  }

  -- Fuzzy finder and it requirments.
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-media-files.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    },
    cmd = 'Telescope',
    config = function()
      require('plugins/telescope')
    end
  }

  -- LSP, LSP installer and tab completion.
  use { 'neovim/nvim-lspconfig' }
  use { 'kabouzeid/nvim-lspinstall' }
  -- use {
  --   'rafamadriz/friendly-snippets',
  --   event = 'InsertEnter'
  -- }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
    },
    -- after = "friendly-snippets",
    config = function()
      require('plugins/cmp')
    end
  }

  -- LSP signature.
  use { "ray-x/lsp_signature.nvim" }

  -- VsCode like pictograms for lsp.
  use { 'onsails/lspkind-nvim' }

  -- View and search LSP symbols, tags in Neovim.
  use { 'liuchengxu/vista.vim', cmd = 'Vista' }

  -- Terminal.
  use {
    'akinsho/nvim-toggleterm.lua',
    cmd = 'ToggleTerm',
    setup = function()
      require('plugins/toggleterm')
    end
  }

  -- Git support for nvim.
  use {
    'tpope/vim-fugitive',
    cmd = 'Git'
  }

  -- Git signs.
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Auto closes.
  use {
    'windwp/nvim-autopairs',
    event = 'BufRead',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }
  -- This is for html and it can autorename too!
  -- use { 'windwp/nvim-ts-autotag' }

  -- Scrollbar.
  use {
    'dstein64/nvim-scrollview',
    event = 'BufRead',
    config = function()
      require('plugins/nvim-scroll')
    end
  }

  -- Smooth scroll.
  use {
    'karb94/neoscroll.nvim',
    event = 'BufRead',
    config = function()
      require('neoscroll').setup()
    end
  }

  -- todo-comments is a lua plugin for Neovim to highlight and search for
  -- todo comments like TODO, HACK, BUG in code base.
  use { 'folke/todo-comments.nvim' }
  -- NOTE Check code to here

  -- WhichKey is a lua plugin that displays a popup with possible
  -- key bindings of the command you started typing.
  use { 'folke/which-key.nvim' }

  -- A plugin for neovim that automatically creates missing directories
  -- on saving a file.
  use {
    'jghauser/mkdir.nvim',
    cmd = 'new',
    config = function()
      require('mkdir')
    end
  }

  -- Neovim plugin to comment text in and out.
  -- Supports commenting out the current line, a visual selection and a motion.
  use {
    'terrortylor/nvim-comment',
    cmd = 'CommentToggle',
    config = function()
      require('nvim_comment').setup()
    end
  }

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use { 'andymass/vim-matchup' }

  -- With this plugin you can resize Neovim buffers easily.
  use { 'artart222/vim-resize' }

  -- Import settings of plugins or start plugins.
  require('plugins/indent-blankline')
  require('plugins/bufferline')
  require('plugins/lualine')
  require('plugins/lspkind')
  require('lsp_signature').setup()
  require('plugins/todo-comments')
  require("which-key").setup()

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
