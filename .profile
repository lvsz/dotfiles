export LANG=en_US.UTF-8
export LC_ALL=$LANG

export EDITOR='vim'
# Have less start with ^C termination and raw characters
export LESS='-KR' # '-N' adds line numbers but messes up wrapped text

export PATH="$PATH:$HOME/.local/bin"

alias rgc='rg -c'
alias rgF='rg -F'
alias rgcF='rg -cF'

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
