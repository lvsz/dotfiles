# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Use case-sensitive completion.
CASE_SENSITIVE="false"

# Reminder to update oh-my-zsh
zstyle ':omz:update' mode reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    gh
    git
    ripgrep
    tmux
    vi-mode
    vscode
)

alias gcs="git commit --gpg-sign"
alias gcsa="git commit --gpg-sign -a"
alias gcas="git commit -a --gpg-sign"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias shlvl='echo $SHLVL'
alias vo='vi'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

#_git_checkout ()
#{
#    __git_has_doubledash && return
#
#    local dwim_opt="$(__git_checkout_default_dwim_mode)"
#
#    case "$prev" in
#    -b|-B|--orphan)
#        # Complete local branches (and DWIM branch
#        # remote branch names) for an option argument
#        # specifying a new branch name. This is for
#        # convenience, assuming new branches are
#        # possibly based on pre-existing branch names.
#        #__git_complete_refs $dwim_opt --mode="heads"
#        __gitcomp_direct "$(__git_heads "" "$cur" " ")"
#        return
#        ;;
#    *)
#        ;;
#    esac
#
#    case "$cur" in
#    --conflict=*)
#        __gitcomp "diff3 merge zdiff3" "" "${cur##--conflict=}"
#        ;;
#    --*)
#        __gitcomp_builtin checkout
#        ;;
#    *)
#        # At this point, we've already handled special completion for
#        # the arguments to -b/-B, and --orphan. There are 3 main
#        # things left we can possibly complete:
#        # 1) a start-point for -b/-B, -d/--detach, or --orphan
#        # 2) a remote head, for --track
#        # 3) an arbitrary reference, possibly including DWIM names
#        #
#
#        if [ -n "$(__git_find_on_cmdline "-b -B -d --detach --orphan")" ]; then
#            __git_complete_refs --mode="refs"
#        elif [ -n "$(__git_find_on_cmdline "--track")" ]; then
#            __git_complete_refs --mode="remote-heads"
#        else
#            echo hehh
#            echo hehh
#            echo hehh
#            __gitcomp_direct "$(__git_heads "" "$cur" " ")"
#            #__git_complete_refs $dwim_opt --mode="refs"
#        fi
#        ;;
#    esac
#}
#

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/odoo/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/odoo/.local/share/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
