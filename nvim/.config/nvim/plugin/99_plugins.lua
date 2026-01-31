-- DRY vim.pack.add for GitHub sources
local function pack(...)
  local args = { ... }
  local plugins_to_process = {}
  if #args == 1 and type(args[1]) == 'table' then
    plugins_to_process = args[1]
  else
    plugins_to_process = args
  end

  local plugins = {}
  for _, plugin in ipairs(plugins_to_process) do
    if type(plugin) == 'string' then
      table.insert(plugins, 'https://github.com/' .. plugin)
    else
      table.insert(plugins, plugin)
    end
  end
  vim.pack.add(plugins)
end

-- local now_if_args, later = _G.Config.now_if_args, MiniDeps.later

-- UI ==================================================
-- Colorscheme
pack('navarasu/onedark.nvim')
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
  },
})
colorscheme.load()

-- Animations
pack('nvim-mini/mini.animate')
require('mini.animate').setup({
  cursor = {
    enable = false
  },
})

-- Highlights
pack('nvim-mini/mini.hipatterns')
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

pack('nvim-mini/mini.indentscope')
local indentscope = require('mini.indentscope')
indentscope.setup({
  draw = {
    animation = indentscope.gen_animation.none(),
    delay = 0,
  },
})

-- Icons
pack('nvim-mini/mini.icons')
require('mini.icons').setup()


-- Statusline
-- Make it a little less noisy
pack('nvim-mini/mini.statusline')
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
pack({
  'tpope/vim-endwise',
  'tpope/vim-surround',
  'tpope/vim-rails',
  'tpope/vim-repeat',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
})

pack('nvim-mini/mini.extra')
require('mini.extra').setup()

-- Motions / Textobjects
pack('nvim-mini/mini.ai')
require('mini.ai').setup({
  n_lines = 500,
})

pack('nvim-mini/mini.jump2d')
require('mini.jump2d').setup()
local jump2d = require('mini.jump2d')
jump2d.setup({
  labels = 'asdfghjkl;',
  view = { dim = true, n_steps_ahead = 2 },
})

-- Alignment
pack('nvim-mini/mini.align')
require('mini.align').setup()

-- Commenting
pack('nvim-mini/mini.comment')
require('mini.comment').setup()

-- Keymap
pack('nvim-mini/mini.clue')
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
pack({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
})

pack('nvim-mini/mini.diff')
require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' },
  },
})

-- Navigation ==================================================
pack('stevearc/oil.nvim')
require('oil').setup()

pack('nvim-mini/mini.pick')
require('mini.pick').setup()

pack('nvim-mini/mini.files')
require('mini.files').setup();

-- Treesitter ===================================================
pack({
  'nvim-treesitter/nvim-treesitter',
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

require('nvim-treesitter').setup({
  ensure_installed = ensure_languages,
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
})
-- local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
-- local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
-- if #to_install > 0 then require('nvim-treesitter').install(to_install) end
--
-- local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()

-- Mason
pack('mason-org/mason.nvim')
require('mason').setup()

-- Conform
pack('stevearc/conform.nvim')
require('conform').setup({
  default_format_opts = {
    -- Allow formatting from LSP server if no dedicated formatter is available
    lsp_format = 'fallback',
  },
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
pack('neovim/nvim-lspconfig')

-- Tailwind is slow to start
vim.lsp.config('tailwindcss', {
  filetypes = {
    "django-html", "htmldjango", "erb", "haml", "html",
    "css", "postcss", "scss", "javascriptreact", "typescriptreact"
  }
})

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

-- Completion
pack('nvim-mini/mini.completion')
local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
local process_items = function(items, base)
  return MiniCompletion.default_process_items(items, base, process_items_opts)
end
require('mini.completion').setup({
  lsp_completion = { source_func = 'omnifunc', auto_setup = false, process_items = process_items },
})

-- Set up LSP part of completion
local on_attach = function(args) vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp' end
_G.Config.new_autocmd('LspAttach', '*', on_attach, 'Custom `on_attach`')
vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
