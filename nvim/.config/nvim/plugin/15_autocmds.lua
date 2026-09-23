-- [[ Basic Autocommands ]]

local yoink = function() vim.hl.hl_op() end
_G.Config.new_autocmd('TextYankPost', '*', yoink, 'Highlight yanked text')
