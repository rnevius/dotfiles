augroup ColorTemplate
  autocmd! * <buffer>
  autocmd BufWritePost <buffer> Colortemplate!
        \ | execute('colorscheme ' . g:colors_name)
  autocmd BufWinEnter <buffer> vert so $VIMRUNTIME/syntax/hitest.vim
augroup END
