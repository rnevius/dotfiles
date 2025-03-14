local group = vim.api.nvim_create_augroup('CodeCompanionHooks', {})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'CodeCompanionChatOpened',
  group = group,
  callback = function(request)
    vim.bo[request.buf].syntax = 'markdown'
  end,
})
