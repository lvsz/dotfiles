export LANG=en_GB.UTF-8
export LC_ALL=$LANG

export EDITOR='vim'
# Have less start with ^C termination and raw characters
export LESS='-KR' # '-N' adds line numbers but messes up wrapped text

export PATH="$PATH:$HOME/.local/bin"

# set up homebrew env if necessary
if [ "`uname -m`" = "arm64" ]
then
    HOMEBREW_PREFIX="/opt/homebrew"
else
    HOMEBREW_PREFIX="/usr/local"
fi
if [ -x "$HOMEBREW_PREFIX/bin/brew" ]
then
    eval "`$HOMEBREW_PREFIX/bin/brew shellenv`"
fi

# if erlang is installed, add it to man path
if [ -d /usr/local/opt/erlang/lib/erlang/man ]
then
    export MANPATH="$MANPATH:/usr/local/opt/erlang/lib/erlang/man"
    if [ -d "$HOME/.cache/rebar3/bin" ]
    then
        export PATH="$PATH:$HOME/.cache/rebar3/bin"
    fi
fi

# make ghc alias if ghc isn't in PATH, but stack is
if [ -n "`command -v stack`" ] && [ -z "`command -v ghc`" ]
then
    alias ghc="stack --silent ghc" ghci="stack --silent ghci"
fi

# JS
export NODE_PATH=$(npm root -quiet -g)

# Java
export PATH="$PATH:/opt/homebrew/opt/openjdk-17/bin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/"
if [ -d "$HOME/Library/Application Support/Coursier/bin" ]
then
    export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
elif [ -d "$HOME/.local/share/coursier/bin" ]
then
    export PATH="$PATH:$HOME/.local/share/coursier/bin"
fi
if [ -z "`command -v cs`" ]
then
    alias cs="coursier"
fi

export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
miniconda () {
    __conda_setup="`$HOME/.local/share/miniconda3/bin/conda shell.${SHELL##*/} hook 2> /dev/null`"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/lvsz/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/lvsz/.local/share/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/lvsz/.local/share/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}
# <<< conda initialize <<<
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
miniforge() {
    __conda_setup="$('/Users/lvsz/.local/share/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/lvsz/.local/share/miniforge3/etc/profile.d/conda.sh" ]; then
            . "/Users/lvsz/.local/share/miniforge3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/lvsz/.local/share/miniforge3/bin:$PATH"
        fi
    fi
unset __conda_setup
}
# <<< conda initialize <<<

alias rkt="racket -S '..'"
alias venv="source venv/bin/activate"
export PYOPENCL_CTX='0'

#if [ -n "`command -v go`" ]
#then
#    export GO111MODULE=on
#    export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
#fi

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]
then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi # added by Nix installer

export PATH="/opt/homebrew/opt/scala@2.13/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/postgresql@15/include"

alias rgc='rg -c'
alias rgF='rg -F'
alias rgcF='rg -cF'

alias run-psql='/opt/homebrew/opt/postgresql@15/bin/postgres -D /opt/homebrew/var/postgresql@15'
