call plug#begin('~/.config/nvim/plugged')

" ----------------------------------------------------------------------------
" Basic Vim Configuration
" ----------------------------------------------------------------------------

let g:vimrcPath = $MYVIMRC
let g:vimPath = system('realpath '.g:vimrcPath)
let g:vimDir = fnamemodify(g:vimPath, ':h')
let g:plugDir = g:vimDir.'/plugged'

set encoding=utf-8                                      " Set right encoding and formats
set fileformat=unix
set updatetime=500                                      " Let plugins show effects after 500ms, not 4s
set fillchars+=stl:\ ,stlnc:\

noremap â b                                             " Mac OS X option-left / right
noremap æ e
inoremap â <C-o>b
inoremap æ <C-o>e<right>
inoremap <F2> <c-o>:w<cr>								" save f2

" ----------------------------------------------------------------------------
" Basic UI Configuration
" ----------------------------------------------------------------------------

set number                                              " Show line number
set showcmd                                             " Show last command
set lazyredraw                                          " Don't redraw when not needed
set laststatus=2                                        " Always show the status line
set scrolloff=10                                        " Keep cursor from reaching end of screen
set autoindent                                          " Auto indent line on CR
set cursorline          				   " highlight current line
set wildmenu            			 	   " visual autocomplete for command menu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoread

set background=dark
" set guifont=DejaVu\ Sans:s12
set guifont=Roboto\ Mono\ Thin\ for\ Powerline:h14

set linespace=14
set guioptions-=r

" ----------------------------------------------------------------------------
" UI Plugins
" ----------------------------------------------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim airline setup

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'

Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'

" ----------------------------------------------------------------------------
" Navigation Plugins
" ----------------------------------------------------------------------------

Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle','NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin' ", {'on': ['<Plug>NERDTreeToggle','<Plug>NERDTreeFind']}

" NERDTree setup

let NERDTreeShowHidden=0
let NERDTreeQuitOnOpen=0
let g:NERDTreeUseSimpleIndicator=1
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.hg', '.DS_Store']


nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>

" ----------------------------------------------------------------------------
" Editing Plugins
" ----------------------------------------------------------------------------

Plug 'jiangmiao/auto-pairs'

" ----------------------------------------------------------------------------
" Colors Themes
" ----------------------------------------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'       " all the colorschemes

" colorscheme gruvbox
colorscheme hybrid_material


" ----------------------------------------------------------------------------
" Source Cotrol Management Plugins
" ----------------------------------------------------------------------------

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Gitgutter setup
let g:gitgutter_realtime=1

" Fugitive setup
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

autocmd BufWritePre * :%s/\s\+$//e

" ----------------------------------------------------------------------------
" Basic useful functions
" ----------------------------------------------------------------------------

function! PreserveCursorPosition(command)
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " do the business:
    execute a:command

    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! StripTrailingWhitespace()
    call PreserveCursorPosition("%s/\\s\\+$//e")
endfunction



" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Call basic functions
nmap <leader>f$ :call StripTrailingWhitespace()<CR>

" Quick save
nnoremap <leader>w :w<cr>

" Navigate buffers
nnoremap <leader>z :bp<cr>
nnoremap <leader>x :bn<cr>

" Add newline with return key
nmap <CR> o<Esc>


" Tab shortcuts
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>


call plug#end()
