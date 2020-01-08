" made for MacVim (https://github.com/macvim-dev/macvim)
syntax on

set t_Co=256
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set nowrap
set hlsearch
set relativenumber
set number
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

" make :Q work like :q
command Q q

" :w shortcut
map ;; :w<Cr>

colorscheme elflord
set background=light
hi Boolean      ctermfg=23
hi Delimiter    ctermfg=247
hi Directory    ctermfg=2
hi Conditional  ctermfg=57
hi Constant     ctermfg=127
hi Function     ctermfg=126
hi Identifier   ctermfg=27 cterm=bold
hi MatchParen   ctermfg=15 ctermbg=42
hi Operator     ctermfg=30
hi PreProc      ctermfg=30 cterm=underline
hi Repeat       ctermfg=29
hi Search       ctermbg=227
hi SpellCap     ctermfg=0  ctermbg=225
hi Statement    ctermfg=24
hi Type         ctermfg=21
hi Visual       ctermbg=195
hi Special      ctermfg=17
hi Comment      ctermfg=244

hi LineNr       ctermfg=248
hi CursorLineNr cterm=bold ctermfg=241

" highlight trailing whitespace
hi ExtraWhitespace ctermbg=220
match ExtraWhitespace /\s\+$/

" press r+Backspace to delete trailing whitespace
map r<Backspace> :%s/\s\s*$//g<Cr>``

" make cursor line stand out
set cursorline
hi CursorLine cterm=bold

autocmd BufNewFile,BufRead *.sc set syntax=scala
autocmd BufNewFile,BufRead *.asm set ft=tasm

autocmd BufNewFile,BufRead *.tex set wrap showbreak=\ \ \ \ 

" C file skeleton
au BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c

" Racket file skeleton
au BufNewFile *.rkt 0r ~/.vim/skeletons/skeleton.rkt
" enable syntastic for racket
let g:syntastic_enable_racket_racket_checker=0

execute pathogen#infect()

call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
