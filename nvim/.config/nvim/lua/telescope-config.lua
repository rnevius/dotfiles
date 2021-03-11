local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "%.gif",
      "%.git",
      "%.jpe?g",
      "%.lock",
      "%.pdf",
      "%.png",
      "%.svg",
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    mappings = {
      i = {
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<C-a>'] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<C-a>'] = actions.send_to_qflist + actions.open_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

-- Mappings
vim.api.nvim_set_keymap(
  'n',
  '<Leader>e',
  '<Cmd>lua require("telescope.builtin").find_files({ hidden = true, previewer = false })<CR>',
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>f',
  '<Cmd>lua require("telescope.builtin").live_grep()<CR>',
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>ls',
  '<Cmd>lua require("telescope.builtin").buffers()<CR>',
  { noremap = true }
)

require('telescope').load_extension('fzy_native')
