-- [[ Basic Autocommands ]]

local yoink = function() vim.hl.on_yank() end
_G.Config.new_autocmd('TextYankPost', '*', yoink, 'Highlight yanked text')
