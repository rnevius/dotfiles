local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    file_ignore_patterns = {
      '%.gif',
      '%.git',
      '%.jpe?g',
      '%.lock',
      '%.pdf',
      '%.png',
      '%.svg',
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    mappings = {
      i = {
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      n = {
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--smart-case',
      '--vimgrep'
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')

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
