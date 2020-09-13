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
" Last Modified:    11.09.2020
" -------------------------------------------------------------

" ------------------------------- "
" SETTING
" ------------------------------- "

highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "scrab"

if !exists("g:scrab_allow_italics")
	let g:scrab_allow_italics = 0
endif 

let s:is_dark   = (&background == "dark")
let s:com_style = "NONE"

if g:scrab_allow_italics == 1
	s:com_style = "italic"
endif

" ------------------------------- "
" FUNCTION 
" ------------------------------- "

function! HI(group, bg_color, fg_color, style)
	let histr  = "highlight " . a:group . " "
	let histr .= "ctermbg=" . a:bg_color[0] . " "
	let histr .= "ctermfg=" . a:fg_color[0] . " "
	let histr .= "cterm=" . a:style . " "
	let histr .= "guibg=" . a:bg_color[1] . " "
	let histr .= "guifg=" . a:fg_color[1] . " "
	let histr .= "gui=" . a:style . " "

	execute histr
endfunction

" ------------------------------- "
" SCHEME COLORS
" ------------------------------- "

" DARK
let s:fg_almost_white     = [255, "#eeeeee"]
let s:fg_very_light_gray  = [248, "#a8a8a8"]
let s:fg_light_gray       = [240, "#585858"]
let s:fg_navajo_white     = [223, "#ffd7af"]
let s:fg_orange           = [214, "#ffaf00"]
let s:fg_dark_orange      = [208, "#ff8700"]
let s:fg_red              = [196, "#ff0000"]
let s:fg_light_yellow     = [190, "#d7ff00"]
let s:fg_light_gold       = [178, "#d7af00"]
let s:fg_pink             = [175, "#d787af"]
let s:fg_indian_red       = [167, "#d75f5f"]
let s:fg_gold             = [142, "#afaf00"]
let s:fg_light_sky_blue   = [109, "#87afaf"]
let s:fg_dark_sea_green   = [108, "#87af87"]
let s:fg_black            = [0,   "#000000"]

let s:bg_gray             = [235, "#262626"]
let s:bg_yellow           = [184, "#d7d700"]
let s:bg_red              = [160, "#d70000"]

" LIGHT
let s:fg_dark_gray        = [235, "#262626"]
let s:fg_dark_pink        = [197, "#ff005f"]
let s:fg_very_dark_orange = [166, "#d75f00"]
let s:fg_dark_gold        = [136, "#af8700"]
let s:fg_chartreuse       = [64,  "#5f8700"]
let s:fg_dark_sky_blue    = [31,  "#0087af"]

let s:bg_cornsilk         = [230, "#ffffd7"]


let s:none                = ["NONE", "NONE"]

" ------------------------------- "
" SET COLORS
" ------------------------------- "

if &t_Co == 256 || has("gui_running")

	if s:is_dark
		set background=dark

		call HI( "Normal",          s:bg_gray,   s:fg_navajo_white,     "NONE" )        " normal text
		call HI( "NonText",         s:none,      s:fg_gold,             "NONE" )        " characters that do not really exist in the text
		call HI( "Comment",         s:none,      s:fg_light_gray,       s:com_style )   " any comment

		call HI( "Constant",        s:none,      s:fg_pink,             "NONE" )        " any constant
		call HI( "String",          s:none,      s:fg_gold,             "NONE" )        " a string constant: 'this is a stirng'
		call HI( "Character",       s:none,      s:fg_pink,             "NONE" )        " a character constant: 'c', '\n'
		call HI( "Number",          s:none,      s:fg_pink,             "NONE" )        " a number constant: 234, 0xff
		call HI( "Boolean",         s:none,      s:fg_pink,             "NONE" )        " a boolean constant: TRUE, false
		call HI( "Float",           s:none,      s:fg_pink,             "NONE" )        " a floating point constant: 2.3e10

		call HI( "Identifier",      s:none,      s:fg_light_sky_blue,   "NONE" )        " any variable name
		call HI( "Function",        s:none,      s:fg_gold,             "bold" )        " function name (also: methods for classes)

		call HI( "Statement",       s:none,      s:fg_indian_red,       "NONE" )        " any statement
		call HI( "Conditional",     s:none,      s:fg_indian_red,       "NONE" )        " if, then, else, endif, switch, etc.
		call HI( "Repeat",          s:none,      s:fg_indian_red,       "NONE" )        " for, do, while, etc.
		call HI( "Label",           s:none,      s:fg_indian_red,       "NONE" )        " case, default, etc.
		call HI( "Operator",        s:none,      s:fg_navajo_white,     "NONE" )        " 'sizeof', '+', '*', etc.
		call HI( "Keyword",         s:none,      s:fg_indian_red,       "NONE" )        " any other keyword
		call HI( "Exception",       s:none,      s:fg_indian_red,       "NONE" )        " try, catch, throw

		call HI( "PreProc",         s:none,      s:fg_dark_sea_green,   "NONE" )        " generic Preprocessor
		call HI( "Include",         s:none,      s:fg_dark_sea_green,   "NONE" )        " preprocessor #include
		call HI( "Define",          s:none,      s:fg_dark_sea_green,   "NONE" )        " preprocessor #define
		call HI( "Macro",           s:none,      s:fg_dark_sea_green,   "NONE" )        " same as Define
		call HI( "PreCondit",       s:none,      s:fg_dark_sea_green,   "NONE" )        " preprocessor #if, #else, #endif, etc.

		call HI( "Type",            s:none,      s:fg_orange,           "NONE" )        " int, long, char, etc.
		call HI( "StorageClass",    s:none,      s:fg_dark_orange,      "NONE" )	       " static, register, volatile, etc.
		call HI( "Structure",       s:none,      s:fg_dark_sea_green,   "NONE" )	       " struct, union, enum, etc.
		call HI( "Typedef",         s:none,      s:fg_orange,           "NONE" )        " a typedef

		call HI( "Special",         s:none,      s:fg_dark_orange,      "NONE" )        " any special symbol: \n, \t
		call HI( "SpecialChar",     s:none,      s:fg_dark_orange,      "NONE" )        " special character in a constant
		call HI( "Tag",             s:none,      s:fg_dark_sea_green,   "NONE" )        " you can use CTRL-] on this
		call HI( "Delimiter",       s:none,      s:fg_very_light_gray,  "NONE" )        " character that needs attention 
		call HI( "SpecialComment",  s:none,      s:fg_very_light_gray,  "NONE" )        " special things inside a comment

		call HI( "Debug",           s:none,      s:fg_very_light_gray,  "NONE" )        " debugging statements
		call HI( "Underlined",      s:none,      s:fg_light_sky_blue,   "underline" )   " text that stands out, HTML links
		call HI( "Ignore",          s:none,      s:fg_light_gray,       "NONE" )        " left blank, hidden
		call HI( "Error",           s:bg_red,    s:fg_almost_white,     "bold" )        " any erroneous construct
		call HI( "Todo",            s:none,      s:fg_very_light_gray,  "italic" )      " anything that needs extra attention; mostly. the keywords TODO FIXME and XXX

		call HI( "LineNr",          s:none,      s:fg_light_gray,       "NONE" )        " line number
		call HI( "CursorLineNr",    s:none,      s:fg_light_yellow,     "NONE" )        " line number when cursor 

		call HI( "DiffAdd",         s:none,      s:fg_light_gold,       "NONE" )        " added line
		call HI( "DiffDelete",      s:none,      s:fg_red,              "NONE" )        " deleted line
		call HI( "DiffChange",      s:none,      s:none,                "NONE" )        " changed line
		call HI( "DiffText",        s:none,      s:fg_light_gold,       "NONE" )        " changed text within a changed line

		call HI( "WarningMsg",      s:bg_yellow, s:fg_black,            "NONE" )        " warning messages
		call HI( "ErrorMsg",        s:bg_red,    s:fg_almost_white,     "NONE" )        " error messages
		call HI( "ModeMsg",         s:none,      s:fg_light_yellow,     "bold" )        " e.g., '-- INSERT --'
		call HI( "MoreMsg",         s:none,      s:fg_light_yellow,     "NONE" )        " other prompt
	else
		set background=light

		call HI( "Normal",          s:bg_cornsilk, s:fg_dark_gray,      "NONE" )
		call HI( "NonText",         s:none,      s:fg_dark_gold,        "NONE" )
		call HI( "Comment",         s:none,      s:fg_light_gray,       s:com_style )

		call HI( "Constant",        s:none,      s:fg_dark_pink,        "NONE" )
		call HI( "String",          s:none,      s:fg_dark_gold,        "NONE" )
		call HI( "Character",       s:none,      s:fg_dark_pink,        "NONE" )
		call HI( "Number",          s:none,      s:fg_dark_pink,        "NONE" )
		call HI( "Boolean",         s:none,      s:fg_dark_pink,        "NONE" )
		call HI( "Float",           s:none,      s:fg_dark_pink,        "NONE" )

		call HI( "Identifier",      s:none,      s:fg_dark_sky_blue,    "NONE" )
		call HI( "Function",        s:none,      s:fg_dark_gold,        "bold" )

		call HI( "Statement",       s:none,      s:fg_indian_red,       "NONE" )
		call HI( "Conditional",     s:none,      s:fg_indian_red,       "NONE" )
		call HI( "Repeat",          s:none,      s:fg_indian_red,       "NONE" )
		call HI( "Label",           s:none,      s:fg_indian_red,       "NONE" )
		call HI( "Operator",        s:none,      s:fg_dark_gray,        "NONE" )
		call HI( "Keyword",         s:none,      s:fg_indian_red,       "NONE" )
		call HI( "Exception",       s:none,      s:fg_indian_red,       "NONE" )

		call HI( "PreProc",         s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "Include",         s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "Define",          s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "Macro",           s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "PreCondit",       s:none,      s:fg_dark_sea_green,   "NONE" )

		call HI( "Type",            s:none,      s:fg_dark_orange,      "NONE" )
		call HI( "StorageClass",    s:none,      s:fg_very_dark_orange, "NONE" )
		call HI( "Structure",       s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "Typedef",         s:none,      s:fg_dark_orange,      "NONE" )

		call HI( "Special",         s:none,      s:fg_very_dark_orange, "NONE" )
		call HI( "SpecialChar",     s:none,      s:fg_very_dark_orange, "NONE" )
		call HI( "Tag",             s:none,      s:fg_dark_sea_green,   "NONE" )
		call HI( "Delimiter",       s:none,      s:fg_very_light_gray,  "NONE" )
		call HI( "SpecialComment",  s:none,      s:fg_very_light_gray,  "NONE" )

		call HI( "Debug",           s:none,      s:fg_very_light_gray,  "NONE" )
		call HI( "Underlined",      s:none,      s:fg_dark_sky_blue,    "underline" )
		call HI( "Ignore",          s:none,      s:fg_light_gray,       "NONE" )
		call HI( "Error",           s:bg_red,    s:fg_almost_white,     "bold" )
		call HI( "Todo",            s:none,      s:fg_very_light_gray,  "italic" )

		call HI( "LineNr",          s:none,      s:fg_light_gray,       "NONE" )
		call HI( "CursorLineNr",    s:none,      s:fg_light_yellow,     "NONE" )

		call HI( "DiffAdd",         s:none,      s:fg_light_gold,       "NONE" )
		call HI( "DiffDelete",      s:none,      s:fg_red,              "NONE" )
		call HI( "DiffChange",      s:none,      s:none,                "NONE" )
		call HI( "DiffText",        s:none,      s:fg_light_gold,       "NONE" )

		call HI( "WarningMsg",      s:bg_yellow, s:fg_black,            "NONE" )
		call HI( "ErrorMsg",        s:bg_red,    s:fg_almost_white,     "NONE" )
		call HI( "ModeMsg",         s:none,      s:fg_chartreuse,       "bold" )
		call HI( "MoreMsg",         s:none,      s:fg_chartreuse,       "NONE" )
	endif
endif
