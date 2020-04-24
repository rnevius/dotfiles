" vim: foldmethod=marker
let mapleader = ","

"    Plugins   {{{
""""""""""""""""""
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
  let g:splitjoin_join_mapping = ''
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_trailing_comma = 1

Plug 'dense-analysis/ale'
  let g:ale_lint_delay=0
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier', 'eslint'],
  \   'ruby': ['rubocop'],
  \ }
  let g:ale_linters = {
  \   'ruby': ['rubocop'],
  \ }
  let g:ale_python_auto_pipenv=1
  let g:ale_sign_error='✘'
  let g:ale_sign_warning='‼'
  nmap <Leader>a <Plug>(ale_fix)
  nmap ]a <Plug>(ale_next_wrap)
  nmap [a <Plug>(ale_previous_wrap)

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = ''
  nnoremap <silent> <Leader>e :Files<CR>
  nnoremap <silent> <Leader>h :Helptags<CR>
  nnoremap <silent> <Leader>ls :Buffers<CR>
  nnoremap <Leader>f :Rg<Space>
  autocmd! FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

Plug 'lifepillar/vim-solarized8'
Plug 'ludovicchabant/vim-gutentags'
  if executable('rg')
    let g:gutentags_file_list_command = 'rg --files'
  endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-python',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
    \ 'coc-yaml',
  \ ]

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

Plug 'pechorin/any-jump.vim'
Plug 'psliwka/vim-smoothie'
  let g:smoothie_base_speed = 32
  let g:smoothie_update_interval = 10

Plug 'rakr/vim-one'
  let g:one_allow_italics = 1

Plug 'sheerun/vim-polyglot'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
  nnoremap <Leader>s :Obsession<CR>

Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" Local Plugs
Plug '~/.config/nvim/plugged/vim-execution/'
  xmap @ <Plug>(execution_execute)

nnoremap <Leader>p :source $MYVIMRC <Bar> PlugUpdate --sync <Bar> PlugClean <CR>
call plug#end()
" }}}

"   Interface  {{{
""""""""""""""""""
if (has('termguicolors'))
  set termguicolors
endif
colorscheme one
set background=light
set colorcolumn=81
set cursorline
set diffopt+=vertical
set guifont=MesloLGS_NF:h13
set list listchars=tab:│\ ,trail:¬,nbsp:·

" Highlights
function! SetCustomHighlights() abort
  highlight StatusLineHL guifg=#f0f0f0 guibg=#50a14f
  highlight StatusLineHLBold cterm=bold gui=bold guifg=#f0f0f0 guibg=#50a14f

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
autocmd VimEnter,ColorScheme * call SetCustomHighlights()

" Status Line
function! GitBranch()
  let branch = FugitiveHead()
  return empty(branch) ? '' : ' ' . branch
endfunction
set statusline=\ 
set statusline+=%f\ %h%m%r\ 
set statusline+=%{coc#status()}\ 
" Align the rest to the right
set statusline+=%=
set statusline+=%{GitBranch()}\ 
set statusline+=%#StatusLineHLBold#
set statusline+=\ %l/%L\ :\ %c
set statusline+=\ 
" }}}

"   Editing  {{{
""""""""""""""""
set complete+=i
if executable('rg')
  set grepprg=rg\ --smart-case\ --vimgrep
endif
set hidden
set ignorecase
if exists('&inccommand')
  set inccommand=nosplit
endif
set linebreak
set modelines=1
set mouse=n
set nojoinspaces
set nostartofline
set noswapfile
set number
set path=.,**
set scrolloff=2
set shiftround
set shiftwidth=2
set shortmess+=I
set smartcase
set splitbelow
set splitright
set tabstop=2
set undofile
set updatetime=500
set wildignore+=*/node_modules/*,*/__pycache__/*,.git/
set wildignore+=*.sw[ponm],*.gif,*.jpg,*.jpeg,*.png,*.pdf,tags,tags.*,*.o,*.class,*.java.html,*.pyc,*.pyo
set wildignorecase
set wildmode=list:full
" }}}

"   Mappings  {{{
"""""""""""""""""
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap Y y$

" Move lines up and down
" <M-j>
nnoremap <silent> ∆ :m +1<CR>==
" <M-k>
nnoremap <silent> ˚ :m -2<CR>==
" <M-j>
inoremap <silent> ∆ <Esc>:m +1<CR>==gi
" <M-k>
inoremap <silent> ˚ <Esc>:m -2<CR>==gi
" <M-j>
vnoremap <silent> ∆ :m '>+1<CR>gv=gv
" <M-k>
vnoremap <silent> ˚ :m '<-2<CR>gv=gv

" Buffers / Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let terminal_event = has('nvim') ? 'TermOpen' : 'TerminalOpen'
augroup terminal_escape
  autocmd!
  execute 'autocmd ' . terminal_event . ' * tnoremap <buffer> <Esc> <C-\><C-N>'
  autocmd FileType fzf tunmap <buffer> <Esc>
augroup END
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" Open a terminal in a horizontal split
nnoremap <silent> <Leader>t :8split +terminal <CR> i

" Cycle through buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
" Cycle through quickfix list
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
" Cycle through location list
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>

" Leader mappings
nnoremap <Leader>] :vert winc ]<CR>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>= `[v`]=
nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>
nnoremap <Leader>cd :lcd %:h<CR>
" nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
" nnoremap <Leader>f :find *
nnoremap <Leader>d "_d
" }}}

"   Commands / Functions  {{{
"""""""""""""""""""""""""""""
" Flutter hot reload
function! HotReload() abort
  if !empty(glob("/tmp/flutter.pid"))
    silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
  endif
endfunction
autocmd BufWritePost *.dart call HotReload()
" Flutter run in :term with hot reloading
command! FlutterRun :8split +terminal flutter run --pid-file /tmp/flutter.pid

" Search for visual block instances
" Inspiration: https://github.com/nelstrom/vim-visual-star-search/
function! VisualSearch(searchcmd)
  let temp = @s
  normal! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:searchcmd.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-U>call VisualSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-U>call VisualSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}}

" Project-specific autocommands
if filereadable(expand("~/.config/nvim/projects.vim"))
  source ~/.config/nvim/projects.vim
endif
