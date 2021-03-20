" vim: foldmethod=marker

"   Editing  {{{
""""""""""""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set colorcolumn=81
set complete-=i
set cursorline
set diffopt+=vertical
set display+=lastline
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set expandtab
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " Delete comment character when joining commented lines
endif
set hidden
if &history < 1000
  set history=1000
endif
set ignorecase
set incsearch
set laststatus=2
set list listchars=tab:│\ ,trail:¬,nbsp:·
set nrformats-=octal
set number
set path+=**
set ruler
set scrolloff=2
set sessionoptions-=options
set shiftround
set shiftwidth=2
set sidescrolloff=5
set smartcase
set smarttab
set splitbelow
set splitright
set startofline
set tabstop=2
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
if &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif
set updatetime=500
set viewoptions-=options
if !empty(&viminfo)
  set viminfo^=!
endif
set wildignore+=*/node_modules/*,*/__pycache__/*,.git/
set wildignore+=*.sw[ponm],*.gif,*.jpg,*.jpeg,*.png,*.pdf,tags,tags.*,*.o,*.class,*.java.html,*.pyc,*.pyo
set wildignorecase
set wildmenu
set wildmode=list:full
" }}}

"   Interface  {{{
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
let &t_ut=''
if has('termguicolors')
  set termguicolors
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }}}

"   Mappings  {{{
"""""""""""""""""
noremap ; :
noremap : ;
inoremap <C-r> <C-r><C-o>
nnoremap c* *Ncgn
nnoremap Q q

" Buffers / Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Cycle through buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
" Cycle through quickfix list
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
" Cycle through location list
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
" }}}
