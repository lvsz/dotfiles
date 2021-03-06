# Import lines from .bashrc file
source "$HOME/.bashrc"

# Add ~/bin to $PATH
export PATH="$HOME/bin:$PATH"
# export PATH="/usr/local/bin:$HOME/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Use vi mode
# set -o vi

# Change shell prompt to only display current directory
PS1="\W\$ "

# keep .bash_history backed up
HISTSIZE="NaN"
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
shopt -s histappend
test `wc -l < ~/.bash_history` -ge 10000 \
    && head -5000 $HOME/.bash_history > $HOME/.history/`date +%Y-%m-%d` \
    && sed -e "1,5000d" $HOME/.bash_history > $HOME/.bash_history.tmp \
    && mv $HOME/.bash_history.tmp $HOME/.bash_history

# Use MacVim as editor when installed, otherwise regular Vim
test $(which mvim) \
    && export EDITOR="$(which mvim) -v" \
    && alias vim="mvim -v" \
    && alias vi="mvim -v" \
    || export EDITOR="usr/local/bin/vim"

export C_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/local/include"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/lib"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

# Use colored ls
alias ls="ls -G"

# Safer rm
alias rm="rm -i"

alias swp?="find . -name '.*swp'"

# Shortcuts
alias exe="chmod +x"
alias cdtmp="cd /tmp"
alias cd..="cd .."
alias rkt="racket -il xrepl"
alias a.out="./a.out"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"
alias julia="exec '/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia'"
alias git-autosign="git config commit.gpgsign true"
alias bell="echo -ne '\a'"

alias josb="jobs"

# rlwrap for repls
test $(which rlwrap) \
  && alias csi="rlwrap csi" \
  && alias lisp="rlwrap lisp" \
  && alias sbcl="rlwrap sbcl --noinform" \
  || echo "rlwrap not installed"

# Haskell bin folder
#export PATH="$PATH:$HOME/Library/Haskell/bin"

# Java home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home"

# Cabal bin folder
export PATH="$PATH:$HOME/.cabal/bin"

# Rust bin folder
export PATH="$PATH:$HOME/.cargo/bin"

# Anaconda bin folder
export PATH="$PATH:$HOME/anaconda3/bin"

# Git tab completion
if test -f $HOME/.git-completion.sh
  then
    source $HOME/.git-completion.sh
  else
    echo "Downloading .git-completion.sh"
    curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -s -o "$HOME/.git-completion.sh"
fi

# Homebrew tab completion
if type brew 2&>/dev/null
  then
    for completion_file in $(brew --prefix)/etc/bash_completion.d/*
      do
        source "$completion_file"
      done
fi
