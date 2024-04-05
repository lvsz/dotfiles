unlet! skip_defaults_vim
if filereadable($VIMRUNTIME . "/defaults.vim")
    source $VIMRUNTIME/defaults.vim
endif

syntax on

set history=1000
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

" tell it to use an undo file
set undofile
" set a directory to store the undo history
if !isdirectory("~/.cache/vim/undo")
    call system("mkdir -p ~/.cache/vim/undo")
endif
set undodir="~/.cache/vim/undo"

" macvim: share clipboard with macOS
set clipboard=unnamed

" use Q to toggle mouse instead of ex mode
map <L-q> :call MouseToggle()<Cr>
function! MouseToggle()
    if &mouse =~# 'a'
        setlocal mouse=""
    else
        setlocal mouse=a
    endif
endfunction
setlocal mouse=a

" make :Q work like :qa
command Q qa

" :w shortcut
map Zz :w<Cr>

" correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

colorscheme elflord
set background=light
hi Normal       ctermfg=59 ctermbg=none
hi Boolean      ctermfg=23
hi Delimiter    ctermfg=246
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
hi Special      ctermfg=69
hi Comment      ctermfg=139
hi Error        ctermfg=88 ctermbg=197 cterm=bold
hi EndOfBuffer  ctermfg=133 ctermbg=none

hi LineNr       ctermfg=248
hi CursorLineNr ctermfg=241 cterm=bold

" make cursor line stand out
set cursorline
hi CursorLine   ctermfg=none ctermbg=231 cterm=bold

" remove any default terminal highlighting
hi Terminal     ctermfg=none ctermbg=none

" change diff colors
hi DiffAdd      ctermfg=22  ctermbg=122
hi DiffChange   ctermfg=18  ctermbg=153
hi DiffDelete   ctermfg=231 ctermbg=31

" highlight trailing whitespace
hi ExtraWhitespace ctermbg=220
match ExtraWhitespace /\s\+$/

" press r+Backspace to delete trailing whitespace
map r<Backspace> :%s/\s\s*$//g<Cr>``

autocmd BufNewFile,BufRead *.sc set syntax=scala
autocmd BufNewFile,BufRead *.asm set ft=tasm
autocmd BufNewFile,BufRead *.tex set wrap showbreak='    '
autocmd BufNewFile,BufRead *.cl set syntax=c
"autocmd BufNewFile,BufRead *.rkt so ~/.vim/plugin/RainbowParenthsis.vim
autocmd BufNewFile,BufRead *.rkt runtime plugin/RainbowParenthsis.vim

" https://github.com/jpalardy/vim-slime
" install at ~/.vim/pack/plugins/start
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

"function! CursHI()
"    if synIDattr(diff_hlID(line('.'), 0), 'bg')
"        set cursorlineopt=number
"    else
"        set cursorlineopt=both
"    endif
"endfunction
"au CursorMoved * call CursHI()

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsUsePythonVersion = 3

function! RestoreCursorPosition()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPosition()
augroup END

" C file skeleton
au BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c

" Racket file skeleton
au BufNewFile *.rkt 0r ~/.vim/skeletons/skeleton.rkt
" enable syntastic for racket
let g:syntastic_enable_racket_racket_checker=0
