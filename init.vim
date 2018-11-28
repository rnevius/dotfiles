" Plugin management via vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

" Solarized Theme
" Make sure to import the color profile to your terminal:
" http://ethanschoonover.com/solarized
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
