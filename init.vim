let mapleader = ","

"" Plugin management via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'idanarye/vim-merginal'
Plug 'jiangmiao/auto-pairs'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"" Plugin Settings
"
" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
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


"" Theme (Solarized)
" Make sure to import the color profile to your terminal.
" http://ethanschoonover.com/solarized
colorscheme solarized
set background=dark
set number
set relativenumber
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


"" Editing
set expandtab
set ignorecase
set noswapfile
set scrolloff=1
set shiftround
set shiftwidth=2
set smartcase
set tabstop=2
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

