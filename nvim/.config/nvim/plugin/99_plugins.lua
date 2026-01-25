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

-- Animations
vim.pack.add({ 'https://github.com/nvim-mini/mini.animate' })
require('mini.animate').setup({
  cursor = {
    enable = false
  },
})

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

vim.pack.add({ 'https://github.com/nvim-mini/mini.indentscope' })
local indentscope = require('mini.indentscope')
indentscope.setup({
  draw = {
    animation = indentscope.gen_animation.none(),
    delay = 0,
  },
})

-- Icons
vim.pack.add({ 'https://github.com/nvim-mini/mini.icons' })
require('mini.icons').setup()


-- Statusline
-- Make it a little less noisy
vim.pack.add({ 'https://github.com/nvim-mini/mini.statusline' });
local statusline = require('mini.statusline')
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

-- Editor Utilities ===================================================
-- tpope!
vim.pack.add({
  'https://github.com/tpope/vim-endwise',
  'https://github.com/tpope/vim-surround',
  'https://github.com/tpope/vim-rails',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.extra' })
require('mini.extra').setup()

-- Motions / Textobjects
vim.pack.add({ 'https://github.com/nvim-mini/mini.ai' })
require('mini.ai').setup({
  n_lines = 500,
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.jump2d' })
require('mini.jump2d').setup()
local jump2d = require('mini.jump2d')
jump2d.setup({
  labels = 'asdfghjkl;',
  view = { dim = true, n_steps_ahead = 2 },
})

-- Commenting
vim.pack.add({ 'https://github.com/nvim-mini/mini.comment' })
require('mini.comment').setup()

-- Keymap
vim.pack.add({ 'https://github.com/nvim-mini/mini.clue' })
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },

  clues = {
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- Git ===================================================
vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rhubarb',
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.diff' })
require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' },
  },
})

-- Navigation ================================================== 
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require('oil').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.pick' })
require('mini.pick').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.files' })
require('mini.files').setup();

-- Treesitter ===================================================
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' }
})
local ensure_languages = {
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
  'regex',
  'sql',
  'typescript',
  'tsx',
  'vim',
  'vimdoc',
  'yaml',
}

-- require('nvim-treesitter').setup({
--   ensure_installed = ensure_languages,
--   -- Autoinstall languages that are not installed
--   auto_install = true,
--   highlight = {
--     enable = true,
--     -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--     --  If you are experiencing weird indenting issues, add the language to
--     --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--     additional_vim_regex_highlighting = { 'ruby' },
--   },
--   indent = { enable = true, disable = { 'ruby' } },
-- })
-- local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
-- local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
-- if #to_install > 0 then require('nvim-treesitter').install(to_install) end
--
-- local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()

-- Mason
vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })
require('mason').setup()

-- Conform
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
require('conform').setup({
  -- Map of filetype to formatters
  -- You can use 'stop_after_first' to run the first available formatter from the list
  formatters_by_ft = {
    javascript = { 'prettier' },
    json = { 'prettier' },
    lua = { 'stylua' },
    python = { 'pyright', 'black', stop_after_first = true },
    ruby = { 'rubocop' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
  -- notify_on_error = false,
})

-- LSP
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable({
  'eslint',
  'lua_ls',
  'marksman',
  'pyright',
  'ruff',
  'solargraph',
  'ts_ls',
  'tailwindcss',
})
