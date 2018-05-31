" Vim color scheme
"
" Name:         blackboard.vim
" Maintainer:   Ben Wyrosdick <ben.wyrosdick@gmail.com> 
" Last Change:  20 August 2009
" License:      public domain
" Version:      1.4

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "blackboard"

if has("gui_running")
  "GUI Colors
  highlight Normal guifg=White   guibg=#121212
  highlight Cursor guifg=Black   guibg=Yellow
  highlight CursorLine guibg=#191E2F
  highlight LineNr guibg=#323232 guifg=#888888
  highlight Folded guifg=#f1f3e8 guibg=#444444
  highlight Pmenu guibg=#84A7C1

  "General Colors
  highlight Comment guifg=#AEAEAE
  highlight Constant guifg=#CAFE1E
  highlight Keyword guifg=#FFDE00
  highlight String guifg=#00D42D
  highlight Type guifg=#84A7C1
  highlight Identifier guifg=#00D42D gui=NONE
  highlight Function guifg=#FF5600 gui=NONE
  highlight clear Search
  highlight Search guibg=#1C3B79
  highlight PreProc guifg=#FF5600

  "HTML Colors
  highlight link htmlTag Type
  highlight link htmlEndTag htmlTag
  highlight link htmlTagName htmlTag

  "Ruby Colors
  highlight link rubyClass Keyword
  highlight link rubyDefine Keyword
  highlight link rubyConstant Type
  highlight link rubySymbol Constant
  highlight link rubyStringDelimiter rubyString
  highlight link rubyInclude Keyword
  highlight link rubyAttribute Keyword
  highlight link rubyInstanceVariable Normal

  "Rails Colors
	highlight link railsMethod         PreProc
	highlight link rubyMethod         PreProc

	highlight link rubyAccess          rubyMethod
	highlight link rubyAttribute       rubyMethod
	highlight link rubyEval            rubyMethod
	highlight link rubyException       rubyMethod
	highlight link rubyInclude         rubyMethod
	highlight link rubyStringDelimiter rubyString
	highlight link rubyRegexp          Regexp
	highlight link rubyRegexpDelimiter rubyRegexp
	"highlight link rubyConstant        Variable
	"highlight link rubyGlobalVariable  Variable
	"highlight link rubyClassVariable   Variable
	"highlight link rubyInstanceVariable Variable

	highlight link javascriptRegexpString  Regexp
	highlight link javascriptNumber        Number
	highlight link javascriptNull          Constant
	highlight link diffAdded        String
	highlight link diffRemoved      Statement
	highlight link diffLine         PreProc
	highlight link diffSubname      Comment
end
