set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

set number

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set background=dark
syntax on

" Fix backspacing in insert mode (https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode)
set backspace=indent,eol,start

packadd! onedark.vim
" packadd! dracula-theme
" colorscheme dracula
colorscheme onedark
" colorscheme PaperColor

" -- shift-tab to detab --
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

set clipboard=unnamed

" Use mouse to select in visual block mode
set mouse+=a
