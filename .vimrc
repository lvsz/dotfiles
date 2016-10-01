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
set completeopt=menuone,menu
filetype plugin indent on

" use Q to toggle mouse instead of ex mode
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
set background=light
hi Directory    ctermfg=2
hi Constant     ctermfg=201
hi Function     ctermfg=25
hi Operator     ctermfg=160
hi Type         ctermfg=32
hi Conditional  ctermfg=57
hi Statement    ctermfg=53
hi Repeat       ctermfg=29
hi Delimiter    ctermfg=240
hi Visual       ctermbg=14
hi Search       ctermbg=227
hi MatchParen   ctermfg=15 ctermbg=42
hi SpellCap     ctermfg=0  ctermbg=225
hi PreProc      cterm=bold ctermfg=30
hi Identifier   cterm=bold ctermfg=27
hi LineNr       ctermfg=248
hi CursorLineNr cterm=bold ctermfg=241

" highlight trailing whitespace
hi ExtraWhitespace ctermbg=220
match ExtraWhitespace /\s\+$/

" make cursor line stand out
set cursorline
hi CursorLine cterm=bold

" racket file skeleton
au BufNewFile *.rkt 0r ~/.vim/skeleton.rkt

execute pathogen#infect()
