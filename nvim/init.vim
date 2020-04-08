" vim: foldmethod=marker
let mapleader = ","

"    Plugins   {{{
""""""""""""""""""
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
  let g:splitjoin_trailing_comma = 1

Plug 'dart-lang/dart-vim-plugin'
Plug 'dense-analysis/ale'
  let g:ale_lint_on_text_changed='normal'
  let g:ale_lint_on_insert_leave=1
  let g:ale_lint_delay=0
  let g:ale_python_auto_pipenv=1
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier', 'eslint'],
  \   'ruby': ['rubocop'],
  \ }

Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = ''
  nnoremap <silent> <Leader>e :Files<CR>
  nnoremap <silent> <Leader>h :Helptags<CR>
  nnoremap <silent> <Leader>ls :Buffers<CR>
  nnoremap <Leader>f :Rg<Space>
  nnoremap <Leader>h :Helptags<CR>
  autocmd! FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

Plug 'lifepillar/vim-solarized8'
Plug 'ludovicchabant/vim-gutentags'
  if executable('rg')
    let g:gutentags_file_list_command = 'rg --files'
  endif

Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'psliwka/vim-smoothie'
  let g:smoothie_base_speed = 32
  let g:smoothie_update_interval = 10

Plug 'rakr/vim-one'
  let g:one_allow_italics = 1

Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'SirVer/ultisnips'
  let g:UltiSnipsJumpForwardTrigger="<c-l>"
  let g:UltiSnipsJumpBackwardTrigger="<c-h>"
  let g:UltiSnipsListSnippets='<c-u>'
  let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'

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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set noshowmode
  let g:airline_theme='one'
  let g:airline_solarized_bg='dark'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.branch='⎇ '
  let g:airline_symbols.linenr=''
  let g:airline_symbols.maxlinenr=''
  let g:airline#extensions#ale#enabled=1
  let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'b', 'error', 'warning', 'z' ]
  \ ]
  let g:airline#extensions#wordcount#enabled=0
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
  function! AirlineInit()
    let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ' :%3v'])
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()

call plug#end()
" }}}

"   Interface  {{{
""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif
colorscheme one
set background=light
set colorcolumn=81
set cursorline
set diffopt+=vertical
set list listchars=tab:»·,trail:¬,nbsp:·
" }}}

"   Editing  {{{
""""""""""""""""
set complete+=i
set expandtab
if executable('rg')
  set grepprg=rg\ --smart-case\ --vimgrep
endif
set hidden
set ignorecase
set inccommand=nosplit
set linebreak
set mouse=n
set nojoinspaces
set noswapfile
set number
set path=.,**
set splitbelow
set splitright
set scrolloff=2
set shiftround
set shiftwidth=2
set shortmess+=I
set smartcase
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
augroup terminal_escape
  autocmd!
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-N>
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
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>= `[v`]=
" nnoremap <Leader>bd :set background=dark <Bar> colorscheme one<CR>
" nnoremap <Leader>bl :set background=light <Bar> colorscheme solarized8_flat<CR>
nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>
" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <Leader>cd :lcd %:h<CR>
" Open files located in the same dir in with the current file is edited
" nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
" nnoremap <Leader>f :find *
" Delete to the black hole register
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
  norm! gv"sy
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
