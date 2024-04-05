export LANG=en_US.UTF-8
export LC_ALL=$LANG

export EDITOR='nvim'
alias vi="$EDITOR"

# Have less start with ^C termination and raw characters
export LESS='-KR' # '-N' adds line numbers but messes up wrapped text

export PATH="$PATH:$HOME/.local/bin"
export PATH="/opt/nvim-linux64/bin:$PATH"
export NODE_PATH="`npm root --quiet -g`"

alias rgc='rg -c'
alias rgF='rg -F'
alias rgcF='rg -cF'

alias gpff='git pull --ff-only'
alias gdt='git difftool'
alias gdt~='git difftool HEAD~'

alias cd15='cd ~/src/odoo/15.0'
alias cd16='cd ~/src/odoo/16.0'
alias cd161='cd ~/src/odoo/16.1'
alias cd162='cd ~/src/odoo/16.2'
alias cd163='cd ~/src/odoo/16.3'
alias cd164='cd ~/src/odoo/16.4'
alias cd17='cd ~/src/odoo/17.0'

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
