augroup HotReload
  autocmd!
  autocmd BufWritePost *.dart call flutter#HotReload()
augroup END
