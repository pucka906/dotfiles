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