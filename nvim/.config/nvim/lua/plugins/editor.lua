-- Editor enhancement plugins
return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Utility plugins
  'tpope/vim-endwise',
  'tpope/vim-surround',
  'tpope/vim-rails',
  'tpope/vim-repeat',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = { char = { enabled = false } },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if there's a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>l', group = '[L]azy' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
      },
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'comment',
        'css',
        'csv',
        'diff',
        'html',
        'htmldjango',
        'javascript',
        'jinja',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'sql',
        'typescript',
        'tsx',
        'vim',
        'vimdoc',
        'yaml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { -- indent guides
        enabled = true,
        indent = { hl = 'IblIndent' },
        scope = { hl = 'IblScope' },
        animate = { enabled = false },
      },
      image = {}, -- image previews / buffers
      lazygit = {}, -- lazygit integration
      picker = { -- picker
        layout = { preset = 'telescope' },
        win = {
          preview = {
            wo = {
              number = false,
              relativenumber = false,
              signcolumn = 'no',
            },
          },
        },
      },
      quickfile = {},
      scroll = {},
      words = {},
    },
    -- stylua: ignore
    keys = {
      -- Lazygit
      { '<leader>lz', function() require('snacks').lazygit() end, desc = 'Lazy[g]it' },

      -- Pickers & Explorer
      { '<leader>e', function() require('snacks').picker.files() end, desc = 'Find Files' },
      { '<leader><leader>', function() require('snacks').picker.buffers() end, desc = 'Find Buffers' },
      { '<leader><Tab>', function() require('snacks').explorer() end, desc = 'File Explorer' },  -- 👹 for pairing
      { '<leader>s:', function() require('snacks').picker.command_history() end, desc = '[S]earch Command History' },
      { '<leader>sg', function() require('snacks').picker.grep() end, desc = '[S]earch [G]rep' },
      { '<leader>sw', function() require('snacks').picker.grep_word() end, desc = 'Visual [S]election or [W]ord', mode = { 'n', 'x' } },

      -- Search
      { '<leader>s"', function() require('snacks').picker.registers() end, desc = '[S]earch Registers' },
      { '<leader>s/', function() require('snacks').picker.search_history() end, desc = '[S]earch History' },
      { '<leader>sd', function() require('snacks').picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
      { '<leader>sD', function() require('snacks').picker.diagnostics_buffer() end, desc = 'Search Buffer [D]iagnostics' },
      { '<leader>sh', function() require('snacks').picker.help() end, desc = '[S]earch [H]elp Pages' },
      { '<leader>sk', function() require('snacks').picker.keymaps() end, desc = '[S]earch [K]eymaps' },
      { '<leader>su', function() require('snacks').picker.undo() end, desc = '[S]earch [U]ndo History' },
    },
  },

  { -- Extend and create a/i textobjects
    'echasnovski/mini.ai',
    opts = { n_lines = 500 },
  },

  { -- Better diffs
    'echasnovski/mini.diff',
    opts = {
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '-' },
      },
    },
  },

  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'folke/snacks.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {},
  },
}
