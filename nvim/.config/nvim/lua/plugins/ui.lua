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

  {
    'echasnovski/mini.statusline',
    opts = { use_icons = vim.g.have_nerd_font },
    config = function(_, opts)
      local statusline = require 'mini.statusline'

      -- Too noisy
      statusline.section_diff = function()
        return ''
      end
      statusline.section_diagnostics = function()
        return ''
      end
      statusline.section_lsp = function()
        return ''
      end
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      statusline.setup(opts)
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
