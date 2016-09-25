" made for MacVim (https://github.com/macvim-dev/macvim)
syntax on

set t_Co=256
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set nowrap
set hlsearch
set rnu " relativemumber
set nu  " and regular number
set backspace=indent,eol,start
filetype plugin indent on

" disable ex mode
map Q <Nop>

" use Q to toggle mouse instead
map Q :call MouseToggle()<Cr>
function! MouseToggle()
    if &mouse =~# 'a'
        setlocal mouse=""
    else
        setlocal mouse=a
    endif
endfunction

" share clipboard with OS X
set clipboard=unnamed

" :w shortcut
map ;; :w<Cr>

colorscheme elflord
hi Directory    ctermfg=2
hi Function     ctermfg=25
hi Type         ctermfg=32
hi Conditional  ctermfg=57
hi Statement    ctermfg=53
hi Delimiter    ctermfg=240
hi Visual       ctermbg=14
hi Search       ctermbg=227
hi MatchParen   ctermfg=15 ctermbg=42
hi SpellCap     ctermfg=0  ctermbg=225
hi PreProc      cterm=bold ctermfg=30
hi Identifier   cterm=bold ctermfg=27
hi CursorLineNr cterm=bold ctermfg=241

hi ExtraWhitespace ctermbg=220
match ExtraWhitespace /\s\+$/

" underline current cursor line
set cursorline
hi CursorLine cterm=bold

" racket file skeleton
au BufNewFile *.rkt 0r ~/.vim/skeleton.rkt

execute pathogen#infect()
