" -------------------------
" PLUGINS
" -------------------------

call plug#begin()

" NERDtree github: https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

call plug#end()

" -------------------------
" BASIC SETTINGS  
" -------------------------

set title
set nu
set ruler
set autoindent

set noswapfile
set confirm

set tabstop=4 "8 default"
set shiftwidth=4

" search
set hlsearch
set incsearch

let g:NERDTreeWinPos = "right"

map <C-n> :NERDTreeToggle<CR>
" ctrl + n  open NERDTree

map <C-b> :NERDTreeFocus<CR>
" ctrl + b

" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" -------------------------
" COLORSCHEME, TEXT
" -------------------------

syntax enable
colorscheme scrab

set encoding=utf8

" -------------------------
" CURSOR
" -------------------------

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
