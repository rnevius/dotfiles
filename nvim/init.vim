" vim: foldmethod=marker
let mapleader = ","

"""""""""""""""""""
""    Plugins   {{{
"""""""""""""""""""
"" Plugin management via vim-plug
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'psliwka/vim-smoothie'
Plug 'rakr/vim-one'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ALE
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_delay=0
let g:ale_python_auto_pipenv=1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\ }

" FZF
autocmd FileType fzf tunmap <buffer> <Esc>
let g:fzf_preview_window = ''
nnoremap <silent> <C-p> :Files<CR>
nnoremap <Leader>ls :Buffers<CR>
nnoremap \ :Rg<Space>
nnoremap <Leader>h :Helptags<CR>

" Git (via Fugitive)
set diffopt+=vertical

" Gutentags
if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
endif

" Smoothie
let g:smoothie_base_speed = 32
let g:smoothie_update_interval = 10

" Splitjoin
let g:splitjoin_trailing_comma = 1

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsListSnippets='<c-u>'
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'

" }}}

"""""""""""""""""""
""   Interface  {{{
"""""""""""""""""""
" Make sure to import the color profile to your terminal.
let g:one_allow_italics = 1
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme one
let g:solarized_term_italics=1
" set cmdheight=2
set colorcolumn=81  " Make it obvious where 80 characters is
set cursorline
set list listchars=tab:»·,nbsp:¬

" Airline Plugin
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
  \ [ 'x', 'y', 'b', 'error', 'warning', 'z' ]
\ ]
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', g:airline_symbols.space.':%3v'])
let g:airline#extensions#wordcount#enabled=0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" }}}

"""""""""""""""""
""   Editing  {{{
"""""""""""""""""
set clipboard=unnamedplus
set expandtab
set hidden
set ignorecase
set inccommand=nosplit
set linebreak
set mouse=n
set noswapfile
set number
set path=.,**
set splitbelow
set splitright
set scrolloff=2
set shiftround
set shiftwidth=2
set smartcase
set tabstop=2
set undofile  " Persistent undo, better than 'hidden'
set wildignore+=*/node_modules/*,*/__pycache__/*,.git/
set wildignore+=*.sw[ponm],*.gif,*.jpg,*.jpeg,*.png,*.pdf,tags,tags.*,*.o,*.class,*.java.html,*.pyc,*.pyo
set wildmode=list:full
" }}}

""""""""""""""""""
""   Mappings  {{{
""""""""""""""""""
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

nnoremap <C-[> <C-t>

" Buffers / Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-N>
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

nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>
" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>cd :lcd %:h<CR>
" Open files located in the same dir in with the current file is edited
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
nnoremap <Leader>f :find *
nnoremap <Leader>/ :nohlsearch<CR>
" Delete to the black hole register
nnoremap <Leader>d "_d
" }}}

""""""""""""""""""
""   Commands  {{{
""""""""""""""""""
if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --smart-case\ --vimgrep
endif
" Flutter hot reload
function! HotReload() abort
  if !empty(glob("/tmp/flutter.pid"))
    silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
  endif
endfunction
autocmd BufWritePost *.dart call HotReload()
" Flutter run in :term with hot reloading
command! FlutterRun :8split +terminal flutter run --pid-file /tmp/flutter.pid
" }}}
