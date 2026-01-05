-- AI tools configuration
return {
  -- Copilot
  'github/copilot.vim',

  -- CodeCompanion
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'saghen/blink.cmp',
    },
    event = 'VeryLazy',
    keys = {
      { '<leader>cc', '<CMD>CodeCompanionChat<CR>', desc = 'New Code Companion Session' },
      { '<leader>cm', '<CMD>CodeCompanionActions<CR>', desc = 'Code Companion Actions' },
      { '<leader>ct', '<CMD>CodeCompanionChat Toggle<CR>', desc = 'Toggle Code Companion' },
    },
    opts = {
      adapters = {
        http = {
          openrouter_claude = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                url = 'https://openrouter.ai/api',
                api_key = 'OPENROUTER_API_KEY',
                chat_url = '/v1/chat/completions',
              },
              schema = {
                model = {
                  default = 'anthropic/claude-3.7-sonnet',
                  gemini = 'google/gemini-2.5-pro-exp-03-25:free',
                },
              },
            })
          end,
        },
      },
      display = {
        chat = {
          show_header_separator = true,
        },
        diff = {
          provider = 'mini_diff',
        },
      },
      strategies = {
        chat = {
          adapter = 'openrouter_claude',
        },
        inline = {
          adapter = 'copilot',
        },
      },
    },
  },
}
