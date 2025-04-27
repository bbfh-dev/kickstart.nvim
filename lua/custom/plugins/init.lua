-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --? NOTE: ⚡ TypeScript integration NeoVim deserves ⚡
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  --? NOTE: Neovim file explorer: edit your filesystem like a buffer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  --? NOTE: Performant, batteries-included completion plugin for Neovim
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = true } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },

  --? NOTE: Use treesitter to auto close and auto rename html tag
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  --? NOTE: Quickly navigate between pinned files
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  --? NOTE: 💾 Simple session management for Neovim
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  --? NOTE: Find And Replace plugin for neovim
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
        -- be specified
      }
    end,
  },

  --? NOTE: The undo history visualizer for VIM
  'mbbill/undotree',

  --? NOTE: A Git wrapper so awesome, it should be illegal
  'tpope/vim-fugitive',

  --? NOTE: Neovim plugin for a code outline window
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },

  --? NOTE: Interactively select and swap function arguments, list elements, and much more. Powered by tree-sitter.
  {
    'mizlan/iswap.nvim',
    event = 'VeryLazy',
    opts = {
      -- Automatically swap with only two arguments
      -- default nil
      autoswap = true,
    },
  },

  --? NOTE: An all in one plugin for converting text case in Neovim
  {
    'johmsalas/text-case.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('textcase').setup {}
      require('telescope').load_extension 'textcase'
    end,
    keys = {
      -- 'ga', -- Default invocation prefix
      { '<leader>cc', vim.cmd.TextCaseOpenTelescope, mode = { 'n', 'x' }, desc = 'Convert text case' },
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    lazy = true,
  },

  --? NOTE: Neovim plugin for splitting/joining blocks of code
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    opts = {
      max_join_length = 10000,
    },
  },

  --? NOTE: Scroll past the end of file just like scrolloff option
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  },

  --? NOTE: generate table of contents for Markdown files.
  'mzlogin/vim-markdown-toc',

  --? NOTE: The fastest Neovim colorizer.
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      '*',
      less = {
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
    },
  },
  'KabbAmine/vCoolor.vim',

  --? NOTE: A library for asynchronous IO in Neovim
  'nvim-neotest/nvim-nio',

  --? NOTE: Clipboard manager neovim plugin with telescope integration
  {
    'AckslD/nvim-neoclip.lua',
    opts = {},
  },

  --? NOTE: Discover the Feature-Rich Go Plugin for Neovim
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  --? NOTE: A plugin to simplify enabling neovim inlay hints(neovim 0.10+).
  {
    'MysticalDevil/inlay-hints.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {},
  },

  --? NOTE: This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
  'theHamsta/nvim-dap-virtual-text',

  --? NOTE: Easily install luarocks with lazy.nvim
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },

  --? NOTE: Hover plugin framework for Neovim
  {
    'lewis6991/hover.nvim',
    opts = {
      init = function()
        -- Require providers
        require 'hover.providers.lsp'
        require 'hover.providers.gh'
        require 'hover.providers.gh_user'
        -- require('hover.providers.jira')
        require 'hover.providers.dap'
        -- require('hover.providers.fold_preview')
        require 'hover.providers.diagnostic'
        require 'hover.providers.man'
        -- require('hover.providers.dictionary')
      end,
      preview_opts = {
        border = 'single',
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        'LSP',
      },
      mouse_delay = 1000,
    },
  },

  --? NOTE:  that runs gotests with Neovim
  {
    'yanskun/gotests.nvim',
    ft = 'go',
    config = function()
      require('gotests').setup()
    end,
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    -- branch = "develop"
    -- (optional) will update plugin's deps on every update
    ---@type gopher.Config
    opts = {},
  },
}
