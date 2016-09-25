source "$HOME/.bashrc"
export PATH="/usr/local/bin:$HOME/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# set -o vi
PS1="\W$ "

# keep .bash_history backed up
HISTSIZE="NaN"
PROMPT_COMMAND="${PROMPT_COMMAND:-:}; history -a"
shopt -s histappend
test `wc -l < ~/.bash_history` -ge 10000 &&
    head -5000 $HOME/.bash_history > $HOME/.history/`date +%Y-%m-%d` &&
    sed -e "1,5000d" $HOME/.bash_history > $HOME/.bash_history.tmp &&
    mv $HOME/.bash_history.tmp $HOME/.bash_history

export EDITOR="/usr/local/bin/vim"
export C_INCLUDE_PATH="/usr/local/include"
export DYLD_LIBRARY_PATH="/usr/local/lib"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

alias exe="chmod +x"
alias rm="rm -i"
alias ls="ls -G"
alias rkt="racket -il xrepl"
alias a.out="./a.out"

# rlwrap for repls
test $(which rlwrap)       &&
  alias csi="rlwrap csi"   &&
  alias lisp="rlwrap lisp" &&
  alias sbcl="rlwrap sbcl --noinform" ||
  echo "rlwrap not installed"

# Haskell bin folder
export PATH="/Users/Levi/Library/Haskell/bin:$PATH"

# git tab completion
test -f $HOME/.git-completion.sh && source $HOME/.git-completion.sh || echo ".git-completion not found"

