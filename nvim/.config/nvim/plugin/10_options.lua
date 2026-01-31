-- General ====================================================================
-- See `:help vim.o`
vim.g.mapleader      = ' ' -- Use `<Space>` as the leader key
vim.g.maplocalleader = ' '

vim.o.mouse       = 'a'      -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.switchbuf   = 'usetab' -- Use already opened buffers when switching
vim.o.undofile    = true     -- Save undo history

-- UI =========================================================================

vim.o.breakindent    = true -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1'  -- Add padding for lists (if 'wrap' is set)
vim.o.number         = true -- Make line numbers default
vim.o.formatoptions  = 'rqnl1j'-- Improve comment editing
vim.o.virtualedit    = 'block' -- Allow going past end of line in blockwise mode


-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.colorcolumn = '+1'
vim.o.termguicolors = true

-- Folds
vim.o.foldenable = false -- Disable folding by default
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldmethod = 'expr'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.infercase     = true    -- Infer case in built-in completion
vim.o.smartcase = true
vim.o.smartindent = true

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 2

-- if performing an operation that would fail due to unsaved changes in the buffer
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm    = true

-- Indentation defaults
vim.o.expandtab  = true  -- Convert tabs to spaces
vim.o.shiftround = true  -- Round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 2  -- Use this number of spaces for indentation
vim.o.tabstop    = 2  -- Tab characters visibly take up this much space

-- Hide intro message and `ins-completion-menu` messages
vim.opt.shortmess:append 'Ic'
vim.o.pumheight       = 10 -- Limit visible height of popup menu
vim.o.pummaxwidth     = 100 -- Limit maximum width of popup menu
vim.o.completeopt     = 'menuone,noinsert,fuzzy,nosort'
vim.o.completetimeout = 100

vim.o.pumborder       = 'bold' -- Use border in built-in completion menu

-- Diagnostics ================================================================

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
local diagnostic_opts = {
  -- Show signs on top of any other sign, but only for warnings and errors
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  -- Show more details immediately for errors on the current line
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },

  -- Don't update diagnostics when typing
  update_in_insert = false,
}
vim.diagnostic.config(diagnostic_opts)
