" -------------------------
" PLUGINS
" -------------------------

call plug#begin()

" NERDtree github: https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" fzf.vim github: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'

call plug#end()

" -------------------------
" BASIC SETTINGS  
" -------------------------

set title
set nu
set ruler
set autoindent

set noswapfile
set nobackup
set confirm

set tabstop=4 	" 8 default
set shiftwidth=4

set encoding=utf8

set hlsearch	" search
set incsearch


map <C-n> :NERDTreeToggle<CR>
" ctrl + n  open NERDTree

map <C-b> :NERDTreeFocus<CR>
" ctrl + b

" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" -------------------------
" VARIABLES
" -------------------------

let g:NERDTreeWinPos = "right"

" -------------------------
" COLORSCHEME
" -------------------------

syntax enable
colorscheme scrab

" -------------------------
" CURSOR
" -------------------------

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
