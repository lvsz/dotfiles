unlet! skip_defaults_vim
if filereadable($VIMRUNTIME . "/defaults.vim")
    source $VIMRUNTIME/defaults.vim
endif

if !has('nvim')
    syntax on
endif

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
set clipboard+=unnamed

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
command Qa qa
command Xa xa
command W wa
command Wa wa
if has('nvim')
    command X Xa
endif

" map Ctrl-C to ESC
inoremap <C-c> <ESC>

" :w shortcuts
map Zz :w<Cr>
map ZX :w<Cr>

"colorscheme elflord
"set background=light
set background=dark
"hi Normal       ctermfg=59 ctermbg=none
"hi Boolean      ctermfg=23
hi Boolean      ctermfg=163
hi Delimiter    ctermfg=117
hi Directory    ctermfg=2
hi Conditional  ctermfg=138
"hi Constant     ctermfg=127
hi Constant     ctermfg=212
hi Identifier   ctermfg=151 cterm=bold
"hi Function     ctermfg=126
hi Function     ctermfg=195
hi MatchParen   ctermfg=15 ctermbg=42
"hi Operator     ctermfg=30
hi Operator     ctermfg=141
"hi PreProc      ctermfg=30 cterm=underline
hi PreProc      ctermfg=141 cterm=underline
"hi Repeat       ctermfg=29
hi Repeat       ctermfg=185
hi Search       ctermbg=227
hi SpellCap     ctermfg=0  ctermbg=225
"hi Statement    ctermfg=115
hi Statement    ctermfg=134
hi Type         ctermfg=39
hi Visual       ctermbg=20
hi Special      ctermfg=68
hi Comment      ctermfg=139
hi Error        ctermfg=88 ctermbg=197 cterm=bold
hi EndOfBuffer  ctermfg=133 ctermbg=none

hi LineNr       ctermfg=248
hi CursorLineNr ctermfg=241 cterm=bold

" make cursor line stand out
set cursorline
"hi CursorLine   ctermfg=none ctermbg=231 cterm=bold
hi CursorLine   ctermfg=none ctermbg=29 cterm=bold

" remove any default :term highlighting
hi Terminal     ctermfg=none ctermbg=none

" change diff colors
hi DiffAdd      ctermfg=17   ctermbg=122
hi DiffChange   ctermfg=18   ctermbg=153
hi DiffDelete   ctermfg=231  ctermbg=31
hi DiffText     ctermfg=none ctermbg=88

" highlight trailing whitespace
hi ExtraWhitespace ctermbg=220 guibg=#ffff00
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
