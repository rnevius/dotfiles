let mapleader = ","

"""""""""""""""""""
""    Plugins
"""""""""""""""""""
"" Plugin management via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'lifepillar/vim-solarized8'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" Development version of vim-transpose
Plug '~/www/vim-transpose'

call plug#end()


"""""""""""""""""""
""   Interface
"""""""""""""""""""
" Theme (Solarized 8)
" Make sure to import the color profile to your terminal.
" http://ethanschoonover.com/solarized
let g:one_allow_italics = 1
set background=light
colorscheme one
let g:solarized_term_italics=1
set colorcolumn=81  " Make it obvious where 80 characters is
set list listchars=tab:»·,nbsp:¬
set mouse=n
if (has("termguicolors"))
  set termguicolors
endif

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

" ALE Linting
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_delay=0
let g:ale_python_auto_pipenv=1

" Git (via Fugitive)
set diffopt+=vertical

" Mappings
nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>


"""""""""""""""""""
""   Editing
"""""""""""""""""""
set expandtab
set hidden
set ignorecase
set inccommand=nosplit  " Incremental substitution
set linebreak
set noswapfile
set number
set relativenumber
set splitbelow
set splitright
set scrolloff=2
set shiftround
set shiftwidth=2
set smartcase
set tabstop=2
set undofile  " Persistent undo, better than 'hidden'

let g:html_indent_tags = 'li\|p'  " Treat <li> and <p> tags like the block tags they are

" Mappings
" inoremap <silent> </ </<C-x><C-o>
nnoremap <Leader>/ :nohlsearch<CR>
" Delete to the black hole register
nnoremap <Leader>d "_d

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsListSnippets='<c-u>'
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'


"""""""""""""""""""
""   Commands
"""""""""""""""""""
" Flutter hot reload
function! HotReload() abort
  if !empty(glob("/tmp/flutter.pid"))
    silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
  endif
endfunction
autocmd BufWritePost *.dart call HotReload()
" Flutter run in :term with hot reloading
command! FlutterRun :sp <Bar> :resize 8 <Bar> :terminal flutter run --pid-file /tmp/flutter.pid


"""""""""""""""""""
""   Navigation
"""""""""""""""""""
nnoremap <C-[> <C-t>
" Buffers / Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
nnoremap <silent> <Leader>t :sp <Bar> :resize 8 <Bar> :terminal <CR> i
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap <Leader>ls :ls<CR>:b<Space>

" CtrlP
" Use ripgrep https://github.com/BurntSushi/ripgrep
if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep\ --no-heading

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --fixed-strings --files --color=never --hidden --glob "!.git/*"'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Rg")
    command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Rg<SPACE>
  endif
endif
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

