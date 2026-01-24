-- UI ================================================== 
-- Colorscheme
vim.pack.add({ 'https://github.com/navarasu/onedark.nvim' })
local colorscheme = require('onedark')
colorscheme.setup({
  style = 'cool', -- or 'dark'
  toggle_style_list = { 'light', 'cool' },
  highlights = {
    CodeCompanionChatTokens = { fg = '$green', fmt = 'italic' },
    CodeCompanionChatSeparator = { fg = '$grey' },
    CodeCompanionChatAgent = { fg = '$bg0', bg = '$orange' },
    CodeCompanionChatTool = { fg = '$bg0', bg = '$green' },
    CodeCompanionChatVariable = { fg = '$bg0', bg = '$blue' },

    -- MiniStatuslineInactive = { fg = '$grey', bg = '$bg1' }, -- Temporary until PR is merged
  },
})
colorscheme.load()

-- Highlights
vim.pack.add({ 'https://github.com/nvim-mini/mini.hipatterns' })
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Icons
vim.pack.add({ 'https://github.com/nvim-mini/mini.icons' })
require('mini.icons').setup()


-- mini.nvim ===================================================
vim.pack.add({ 'https://github.com/nvim-mini/mini.statusline' });
local statusline = require('mini.statusline')

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

-- Navigation ================================================== 
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require('oil').setup()


