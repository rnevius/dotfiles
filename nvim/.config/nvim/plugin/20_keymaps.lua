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
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- Themes
nmap_leader('tc', '<CMD>lua require("onedark").toggle()<CR>', '[T]oggle between theme [C]olors')

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
-- Flash
vim.keymap.set({ "n", "x", "o" }, 's', function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, 'S', function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

-- Mini Pick
nmap_leader('e', '<Cmd>Pick files<CR>', 'Pick Files')
nmap_leader('<Leader>', '<Cmd>Pick buffers<CR>', 'Pick Buffer')
nmap_leader('s:', '<Cmd>Pick history scope=":"<CR>', '[S]earch Command History')
nmap_leader('sg', '<Cmd>Pick grep_live<CR>', '[S]earch [G]rep')
nmap_leader('sG', '<Cmd>Pick grep pattern="<cword>"<CR>', '[S]earch for Word')
nmap_leader('sd','<Cmd>Pick disgnostic scope="current"<CR>', 'Search Buffer [D]iagnostics')
nmap_leader('sD','<Cmd>Pick disgnostic scope="all"<CR>', 'Search [D]iagnostics')

-- Oil
-- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
local explore_at_file = '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>'
vim.keymap.set('n', '-', explore_at_file, { desc = 'Explore' })

