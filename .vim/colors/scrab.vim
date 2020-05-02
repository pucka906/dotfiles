"
" .d8888.  .o88b. d8888b.  .d8b.  d8888b. 
" 88'  YP d8P  Y8 88  `8D d8' `8b 88  `8D 
" `8bo.   8P      88oobY' 88ooo88 88oooY' 
"   `Y8b. 8b      88`8b   88~~~88 88~~~b. 
" db   8D Y8b  d8 88 `88. 88   88 88   8D 
" `8888Y'  `Y88P' 88   YD YP   YP Y8888P'                                       
"
" -------------------------------------------------------------
" File:             scrab.vim
" Description:      aaa
" Author:           pucka
" Last Modified:    15.02.2020
" -------------------------------------------------------------

" ------------------------------- "
" SETTING
" ------------------------------- "

highlight clear

if exists("syntax_on")
	syntax reset
endif

set background=dark
let g:colors_name = "scrab"

" ------------------------------- "
" FUNCTION 
" ------------------------------- "

function! HI(group, ctermbg, ctermfg, guibg, guifg, gui)
	let histr = 'highlight ' . a:group . ' '
	let histr .= 'ctermbg=' . a:ctermbg . ' '
	let histr .= 'ctermfg=' . a:ctermfg . ' '
	let histr .= 'cterm=' . a:gui . ' '
	let histr .= 'guibg=' . a:guibg . ' '
	let histr .= 'guifg=' . a:guifg . ' '
	let histr .= 'gui=' . a:gui . ' '

	execute histr
endfunction

" ------------------------------- "
" COLORS
" ------------------------------- "

if &t_Co == 256 || has("gui_running")
	call HI( "Normal",          "235", "223", "#262626", "#ffd7af", "NONE" )		" normal text
	call HI( "NonText",         "NONE", "142", "NONE", "#afaf00", "NONE" )			" characters that do not really exist in the text
	call HI( "Comment",         "NONE", "240", "NONE", "#585858", "NONE" )			" any comment

	call HI( "Constant",        "NONE", "175", "NONE", "#d787af", "NONE" )			" any constant
	call HI( "String",          "NONE", "142", "NONE", "#afaf00", "NONE" )			" a string constant: 'this is a stirng'
	call HI( "Character",       "NONE", "175", "NONE", "#d787af", "NONE" )			" a character constant: 'c', '\n'
	call HI( "Number",          "NONE", "175", "NONE", "#d787af", "NONE" )			" a number constant: 234, 0xff
	call HI( "Boolean",         "NONE", "175", "NONE", "#d787af", "NONE" )			" a boolean constant: TRUE, false
	call HI( "Float",           "NONE", "175", "NONE", "#d787af", "NONE" )			" a floating point constant: 2.3e10

	call HI( "Identifier",      "NONE", "109", "NONE", "#87afaf", "NONE" )			" any variable name
	call HI( "Function",        "NONE", "142", "NONE", "#afaf00", "bold" )			" function name (also: methods for classes)

	call HI( "Statement",       "NONE", "167", "NONE", "#d75f5f", "NONE" )			" any statement
	call HI( "Conditional",     "NONE", "167", "NONE", "#d75f5f", "NONE" )			" if, then, else, endif, switch, etc.
	call HI( "Repeat",          "NONE", "167", "NONE", "#d75f5f", "NONE" )			" for, do, while, etc.
	call HI( "Label",           "NONE", "167", "NONE", "#d75f5f", "NONE" )			" case, default, etc.
	call HI( "Operator",        "NONE", "223", "NONE", "#ffd7af", "NONE" )			" 'sizeof', '+', '*', etc.
	call HI( "Keyword",         "NONE", "167", "NONE", "#d75f5f", "NONE" )			" any other keyword
	call HI( "Exception",       "NONE", "167", "NONE", "#d75f5f", "NONE" )			" try, catch, throw

	call HI( "PreProc",         "NONE", "108", "NONE", "#87af87", "NONE" )			" generic Preprocessor
	call HI( "Include",         "NONE", "108", "NONE", "#87af87", "NONE" )			" preprocessor #include
	call HI( "Define",          "NONE", "108", "NONE", "#87af87", "NONE" )			" preprocessor #define
	call HI( "Macro",           "NONE", "108", "NONE", "#87af87", "NONE" )			" same as Define
	call HI( "PreCondit",       "NONE", "108", "NONE", "#87af87", "NONE" )			" preprocessor #if, #else, #endif, etc.

	call HI( "Type",            "NONE", "214", "NONE", "#ffaf00", "NONE" )			" int, long, char, etc.
	call HI( "StorageClass",    "NONE", "208", "NONE", "#ff8700", "NONE" )			" static, register, volatile, etc.
	call HI( "Structure",       "NONE", "108", "NONE", "#87af87", "NONE" )			" struct, union, enum, etc.
	call HI( "Typedef",         "NONE", "214", "NONE", "#ffaf00", "NONE" )			" a typedef

	call HI( "Special",         "NONE", "208", "NONE", "#ff8700", "NONE" )			" any special symbol: \n, \t
	call HI( "SpecialChar",     "NONE", "208", "NONE", "#ff8700", "NONE" )			" special character in a constant
	call HI( "Tag",             "NONE", "108", "NONE", "#87af87", "NONE" )			" you can use CTRL-] on this
	call HI( "Delimiter",       "NONE", "248", "NONE", "#a8a8a8", "NONE" )			" character that needs attention 
	call HI( "SpecialComment",  "NONE", "248", "NONE", "#a8a8a8", "NONE" )			" special things inside a comment

	call HI( "Debug",           "NONE", "248", "NONE", "#a8a8a8", "NONE" )			" debugging statements
	call HI( "Underlined",      "NONE", "109", "NONE", "#87afaf", "underline" )		" text that stands out, HTML links
	call HI( "Ignore",          "NONE", "240", "NONE", "#585858", "NONE" )			" left blank, hidden
	call HI( "Error",           "160", "255", "#d70000", "#eeeeee", "bold" )		" any erroneous construct
	call HI( "Todo",            "NONE", "246", "NONE", "#949494", "italic" )		" anything that needs extra attention; mostly. the keywords TODO FIXME and XXX

	call HI( "LineNr",          "NONE", "240", "NONE", "#585858", "NONE" )			" line number
	call HI( "CursorLineNr",    "NONE", "190", "NONE", "#d7ff00", "NONE" )			" line number when cursor 

	call HI( "DiffAdd",         "NONE", "178", "NONE", "#d7af00", "NONE" )			" added line
	call HI( "DiffDelete",      "NONE", "196", "NONE", "#ff0000", "NONE" )			" deleted line
	call HI( "DiffChange",      "NONE", "NONE", "NONE", "NONE", "NONE" )			" changed line
	call HI( "DiffText",        "NONE", "178", "NONE", "#d7af00", "NONE" )			" changed text within a changed line

	call HI( "WarningMsg",      "184", "0", "#d7d700", "#000000", "NONE" )			" warning messages
	call HI( "ErrorMsg",        "160", "255", "#d70000", "#eeeeee", "NONE" )		" error messages
	call HI( "ModeMsg",         "NONE", "190", "NONE", "#d7ff00", "bold" )			" e.g., '-- INSERT --'
	call HI( "MoreMsg",         "NONE", "190", "NONE", "#d7ff00", "NONE" )			" other prompt
endif
