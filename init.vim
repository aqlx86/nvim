set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set autoread

set fillchars+=stl:\ ,stlnc:\

" Let plugins show effects after 500ms, not 4s
set updatetime=500

set laststatus=2

" Mac OS X option-left / right
noremap â b
noremap æ e
inoremap â <C-o>b
inoremap æ <C-o>e<right>

set guifont=DejaVu\ Sans:s12

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme= 'kalisi'
let g:airline_powerline_fonts = 1


call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'

call plug#end()
