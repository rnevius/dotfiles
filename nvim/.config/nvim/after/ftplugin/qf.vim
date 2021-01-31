setlocal statusline=\ 
setlocal statusline+=%t
setlocal statusline+=%{exists('w:quickfix_title')?'\ '.w:quickfix_title:''}
setlocal statusline+=%=
setlocal statusline+=%l\ /\ %{getline(1)==''?'0':line('$')}\ Results
setlocal statusline+=\ 
