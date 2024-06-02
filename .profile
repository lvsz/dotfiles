export LANG=en_US.UTF-8
export LC_ALL=$LANG

export EDITOR='nvim'
# Have less start with ^C termination and raw characters
export LESS='-KR' # '-N' adds line numbers but messes up wrapped text

export PATH="$PATH:$HOME/.local/bin"
export PATH="/opt/nvim-linux64/bin:$PATH"
export NODE_PATH="`npm root --quiet -g`"

alias vi='nvim'

alias pbcopy='xclip -selection clipboard -n'

alias rgc='rg -c'
alias rgF='rg -F'
alias rgcF='rg -cF'

alias gpff='git pull --ff-only'
alias gdt='git difftool'
alias gdt~='git difftool HEAD~'
alias ghpr='>/dev/null gh pr list -H `git_current_branch` --web&'

gswp() {
    __branch=`git_current_branch`
    __parent=`grep -Eo '^((saas-)?[0-9]+\.[0-9]|master)' <<< $__branch`
    if [ -n "$__parent" ]
    then
        gsw $__parent
    else
        >&2 echo "no parent found branch found for $__branch"
        return 1
    fi
}

alias cd15='cd ~/src/odoo/15.0'
alias cd16='cd ~/src/odoo/16.0'
alias cd161='cd ~/src/odoo/16.1'
alias cd162='cd ~/src/odoo/16.2'
alias cd163='cd ~/src/odoo/16.3'
alias cd164='cd ~/src/odoo/16.4'
alias cd17='cd ~/src/odoo/17.0'

PROFILE=$0
test ! -x "$(command -v conf)" && conf() {
    case "$1" in
        'tmux') $EDITOR ${ZSH_TMUX_CONFIG:-~/.tmux.conf};;
        'vim') $EDITOR ~/.vimrc;;
        'nvim') $EDITOR ~/.config/nvim/lua/config.lua;;
        'kitty') $EDITOR ~/.config/kitty/kitty.conf;;
        'zsh') $EDITOR ~/.zshrc;;
        'bash') $EDITOR ~/.bashrc;;
        *) $EDITOR $PROFILE;;
    esac
}

chpy() {
    case `python3 --version | grep -o '3\.[0-9]*'` in
        '3.10') _changeto='3.11';;
        *) _changeto='3.10';;
    esac
    sudo update-alternatives --set python3 "/usr/bin/python${_changeto}"
}

fde() {
    nvim -n `fd $1`
}

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
