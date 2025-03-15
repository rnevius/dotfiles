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
        CodeCompanionChatTokens = { fg = '$green', fmt = 'italic' },
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
