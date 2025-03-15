-- UI related plugins
return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = 'cool', -- or 'dark'
      toggle_style_list = { 'cool', 'light' },
      highlights = {
        CodeCompanionChatTokens = { fg = '#98c379', fmt = 'italic' },
        CodeCompanionChatSeparator = { fg = '$grey' },
        CodeCompanionChatAgent = { fg = '$bg0', bg = '$orange' },
        CodeCompanionChatTool = { fg = '$bg0', bg = '$green' },
        CodeCompanionChatVariable = { fg = '$bg0', bg = '$blue' },
      },
    },
    init = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      indent = {
        enabled = true,
        indent = {
          hl = 'IblIndent',
        },
        scope = {
          hl = 'IblScope',
        },
        animate = {
          enabled = false,
        },
      },
      -- input = { enabled = true },
      -- notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Useful for getting pretty icons, but requires a Nerd Font.
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
