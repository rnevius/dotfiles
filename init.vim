"" Plugin management via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

"" Plugin Settings
"
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
" Fugitive
set diffopt+=vertical


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
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
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

