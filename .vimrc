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

map <C-n> :NERDTreeToggle<CR>
" ctrl + n  open NERDTree

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
