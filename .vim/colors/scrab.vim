" -------------------------------------------------------------
" File: scrab.vim
" Description:
" Author: pucka
" Source: none
" Last Modified: 16.12.2019
" -------------------------------------------------------------

highlight clear
if exists("syntax_on")
	syntax reset
endif

" ------------------------------- "
" SETTING
" ------------------------------- "
set background=dark
let g:colors_name="scrab"

" ------------------------------- "
" FUNCTION 
" ------------------------------- "
function! HL(group, guibg, guifg, gui, ctermbg, ctermfg)
  let highlightstr = 'highlight ' . a:group . ' '
  let highlightstr .= 'guibg=' . a:guibg . ' '
  let highlightstr .= 'guifg=' . a:guifg . ' '
  let highlightstr .= 'gui=' . a:gui . ' '
  let highlightstr .= 'ctermbg=' . a:ctermbg . ' '
  let highlightstr .= 'ctermfg=' . a:ctermfg . ' '
  let highlightstr .= 'cterm=' . a:gui . ' '

  execute highlightstr
endfunction

" ------------------------------- "
" COLORS
" ------------------------------- "

call HL("Normal", "#262626", "#ffd7af", "NONE", "235", "223")

call HL("Comment", "NONE", "#8a8a8a", "italic", "NONE", "245")       " any comment

call HL("Constant", "NONE", "#d787af", "NONE", "NONE", "175")        " any constant
call HL("String", "NONE", "#afaf00", "NONE", "NONE", "142")          " a string constant: 'this is a stirng'
call HL("Character", "NONE", "#d787af", "NONE", "NONE", "175")       " a character constant: 'c', '\n'
call HL("Number", "NONE",  "#d787af", "NONE", "NONE", "175")         " a number constant: 234, 0xff
call HL("Boolean", "NONE", "#d787af", "NONE", "NONE", "175")         " a boolean constant: TRUE, false
call HL("Float", "NONE", "#d787af", "NONE", "NONE", "175")           " a floating point constant: 2.3e10

call HL("Identifier", "NONE", "#87afaf", "NONE", "NONE", "109")      " any variable name
call HL("Function", "NONE", "#afaf00", "bold", "NONE", "142")        " function name (also: methods for classes)

call HL("Statement", "NONE", "#d75f5f", "NONE", "NONE", "167")       " any statement
call HL("Conditional", "NONE", "#d75f5f", "NONE", "NONE", "167")     " if, then, else, endif, switch, etc.
call HL("Repeat", "NONE", "#d75f5f", "NONE", "NONE", "167")          " for, do, while, etc.
call HL("Label", "NONE", "#d75f5f", "NONE", "NONE", "167")           " case, default, etc.
call HL("Operator", "NONE", "#ffd7af", "NONE", "NONE", "223")        " 'sizeof', '+', '*', etc.
call HL("Keyword", "NONE", "#d75f5f", "NONE", "NONE", "167")         " any other keyword
call HL("Exception", "NONE", "#d75f5f", "NONE", "NONE", "167")       " try, catch, throw

call HL("PreProc", "NONE", "#87af87", "NONE", "NONE", "108")         " generic Preprocessor
call HL("Include", "NONE", "#87af87", "NONE", "NONE", "108")         " preprocessor #include
call HL("Define", "NONE", "#87af87", "NONE", "NONE", "108")          " preprocessor #define
call HL("Macro", "NONE", "#87af87", "NONE", "NONE", "108")           " same as Define
call HL("PreCondit", "NONE", "#87af87", "NONE", "NONE", "108")       " preprocessor #if, #else, #endif, etc.

call HL("Type", "NONE", "#ffaf00", "NONE", "NONE", "214")            " int, long, char, etc.
call HL("StorageClass", "NONE", "#ff8700", "NONE", "NONE", "208")    " static, register, volatile, etc.
call HL("Structure", "NONE", "#87af87", "NONE", "NONE", "108")       " struct, union, enum, etc.
call HL("Typedef", "NONE", "#ffaf00", "NONE", "NONE", "214")         " A typedef

call HL("Special", "NONE", "#ff8700", "NONE", "NONE", "208")         " any special symbol
call HL("SpecialChar", "NONE", "#ff8700", "NONE", "NONE", "208")     " special character in a constant
call HL("Tag", "NONE", "#87af87", "NONE", "NONE", "108")             " you can use CTRL-] on this
call HL("Delimiter", "NONE", "#a8a8a8", "NONE", "NONE", "248" )      " character that needs attention
call HL("SpecialComment", "NONE", "#a8a8a8", "NONE", "NONE", "248")  " special things inside a comment
call HL("Debug", "NONE", "#a8a8a8", "NONE", "NONE", "248")           " debugging statements

call HL("Underlined", "NONE", "#87afaf", "underline", "NONE", "109") " text that stands out, HTML links
call HL("Ignore", "NONE", "#d787af", "NONE", "NONE", "175")          " left blank, hidden  |hl-Ignore|
call HL("Error", "NONE", "#d70000", "bold", "NONE", "160")           " any erroneous construct
call HL("Todo", "NONE", "#ffd7af", "bold", "NONE", "223")            " anything that needs extra attention; mostly. the keywords TODO FIXME and XXX

call HL("LineNr", "NONE", "#585858", "NONE", "NONE", "240")          " line number for ':number' and ':#' commands.
call HL("CursorLineNr", "NONE", "#d7ff00", "NONE", "NONE", "190")    " like LineNr when 'cursorline' is set.

call HL("NonText", "NONE", "#afaf00", "NONE", "NONE", "142")         "  

call HL("ModeMsg", "NONE", "#d7ff00", "bold", "NONE", "190")         " 'showmode' message (e.g., '-- INSERT --')
call HL("MoreMsg", "NONE", "#d7ff00", "NONE", "NONE", "190")         " other prompt
