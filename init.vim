let mapleader = ","

"" Plugin management via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'lifepillar/vim-solarized8'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()


"" Plugin Settings
"
" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#wordcount#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" CtrlP
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --ignore-dir .git --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
" CtrlPCmdPalette
nnoremap <Leader>p :CtrlPCmdPalette<cr>
" Fugitive
set diffopt+=vertical
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsListSnippets='<c-u>'
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips/'


"" Theme (Solarized 8)
" Make sure to import the color profile to your terminal.
" http://ethanschoonover.com/solarized
colorscheme solarized8_flat
let g:solarized_term_italics=1
set background=light
set linebreak
set number
set relativenumber
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set termguicolors
nnoremap <Leader>bd :set background=dark<CR>
nnoremap <Leader>bl :set background=light<CR>


"" Editing
set expandtab
set inccommand=nosplit
set ignorecase
set noswapfile
set scrolloff=5
set shiftround
set shiftwidth=2
set smartcase
set tabstop=2
" Make it obvious where 80 characters is
set colorcolumn=81
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
nnoremap <Leader>n :nohlsearch<CR>

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Persistent undo, better than 'hidden'
set undofile

"" User-defined functions
" Trigger Flutter hot reload
function! HotReload() abort
  if !empty(glob("/tmp/flutter.pid"))
    silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
  endif
endfunction
autocmd BufWritePost *.dart call HotReload()
" Run Flutter in :term with hot reloading
command! FlutterRun :sp | :res 8 | :terminal flutter run --pid-file /tmp/flutter.pid

