function! flutter#HotReload() abort
  if !empty(glob('/tmp/flutter.pid'))
    silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
  endif
endfunction

function! flutter#RunWithPID()
  silent execute '8split +terminal\ flutter\ run\ --pid-file\ /tmp/flutter.pid'
endfunction
