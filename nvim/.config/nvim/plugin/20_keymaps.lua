local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- Remap ';' to ':' in normal and visual mode
vim.keymap.set({ 'n', 'v' }, ';', ':')
-- Remap ':' to ';' in normal and visual modes
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Disable the space key in normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Themes
nmap_leader('tc', '<Cmd>lua require("onedark").toggle()<CR>', '[T]oggle between theme [C]olors')

-- Diagnostic keymaps
nmap_leader('q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
nmap_leader('d', vim.diagnostic.open_float, 'Open floating diagnostic message')
nmap_leader('q', vim.diagnostic.setloclist, 'Open diagnostics list')

-- copilot
vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
vim.keymap.set('i', '<C-h>', 'copilot#Previous()', { silent = true, expr = true })
vim.keymap.set('i', '<C-k>', 'copilot#Next()', { silent = true, expr = true })


-- Plugins ===================================================
-- Conform (LSP formatting)
local conform_format = '<Cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>'
nmap_leader('f', conform_format, '[F]ormat Buffer')

-- Jump
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() MiniJump2d.start(MiniJump2d.builtin_opts.single_character) end, { desc = 'Jump' })

-- LSP
-- See :help lsp-defaults

-- Mini Pick
nmap_leader('e', '<Cmd>Pick files<CR>', 'Pick Files')
nmap_leader('<Leader>', '<Cmd>Pick buffers<CR>', 'Pick Buffer')
nmap_leader('s:', '<Cmd>Pick history scope=":"<CR>', '[S]earch Command History')
nmap_leader('sh', '<Cmd>Pick help<CR>', '[S]earch Help Tags')
nmap_leader('sg', '<Cmd>Pick grep_live<CR>', '[S]earch [G]rep')
nmap_leader('sG', '<Cmd>Pick grep pattern="<cword>"<CR>', '[S]earch for Word')
nmap_leader('sd', '<Cmd>Pick disgnostic scope="current"<CR>', 'Search Buffer [D]iagnostics')
nmap_leader('sD', '<Cmd>Pick disgnostic scope="all"<CR>', 'Search [D]iagnostics')

-- Oil
vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })
local explore_at_file = '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>'
vim.keymap.set('n', '<Tab>', explore_at_file, { desc = 'Explore' })

