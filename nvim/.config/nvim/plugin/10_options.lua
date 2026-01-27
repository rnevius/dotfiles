-- General ====================================================================
-- See `:help vim.o`
vim.g.mapleader      = ' ' -- Use `<Space>` as the leader key
vim.g.maplocalleader = ' '

vim.o.mouse       = 'a'      -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.switchbuf   = 'usetab' -- Use already opened buffers when switching
vim.o.undofile    = true     -- Save undo history

-- UI =========================================================================

vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.number = true -- Make line numbers default


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
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

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
vim.o.confirm = true

-- Indentation defaults
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Hide intro message and `ins-completion-menu` messages
vim.opt.shortmess:append 'Ic'
vim.o.pummaxwidth = 100 -- Limit maximum width of popup menu
vim.o.completeopt = 'menuone,noinsert,fuzzy,nosort'
vim.o.completetimeout = 100

vim.o.pumborder = 'bold' -- Use border in built-in completion menu
