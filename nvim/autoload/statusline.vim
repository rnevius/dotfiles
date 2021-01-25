" Highlights
function! statusline#SetCustomHighlights() abort
  let current_scheme = get(g:, 'colors_name', 'default')
  if current_scheme == 'one'
    if &background == 'light'
      call one#highlight('StatusLine', '', 'e0e0e0', 'bold')
      call one#highlight('StatusLineNC', '494b53', 'f0f0f0', 'none')
    else
      call one#highlight('StatusLine', '', '3e4452', 'bold')
      call one#highlight('StatusLineNC', 'abb2bf', '2b323d', 'none')
    end
  end
endfunction

" ALE
let s:ale_fixing = 0
augroup ALEFixProgress
  autocmd!
  autocmd User ALEFixPre  let s:ale_fixing = 1 | redrawstatus
  autocmd User ALEFixPost let s:ale_fixing = 0 | redrawstatus
augroup END
function! statusline#ALEFixStatus() abort
  return s:ale_fixing ? ' ALE Fixing ' : ''
endfunction

function! statusline#LSPStatus() abort
  return luaeval('#vim.lsp.buf_get_clients() > 0') ? '[LSP]' : ''
endfunction

" git
function! statusline#GitBranch() abort
  if !exists('g:loaded_fugitive') || !exists('b:git_dir')
    return ''
  endif
  let branch = FugitiveHead(7)
  return empty(branch) ? '' : ' ' . branch
endfunction

" session
function! statusline#SessionStatus() abort
  if !exists('g:loaded_obsession')
    return ''
  endif

  return ObsessionStatus('[●]', '[❚❚]')
endfunction
