[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases
[[ -f ~/.zsh_functions ]] && . ~/.zsh_functions
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
. /Users/puchin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH=/usr/local/bin/vim:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH 
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
#export PATH=/usr/local/opt/python/libexec/bin:$PATH
export LANG=en_US.UTF-8 # Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set Vim as default editor
export EDITOR=vim

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# originally set Action: Send Text with "vim" Special Chars 
# with \033b, \033f in iTerm2 setting
bindkey '^O' beginning-of-line
bindkey '^F' forward-word
bindkey '^B' backward-word

bindkey '^K' kill-whole-line
bindkey '^U' backward-kill-line 
bindkey '^T' kill-line

#setopt CORRECT
#setopt AUTO_CD

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="ys"
#ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions vi-mode autojump)

source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'



#autoload -U promptinit; promptinit
#prompt pure
# prompt username
#DEFAULT_USER=`whoami`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# place this after nvm initialization!
autoload -U add-zsh-hook
export VIRTUAL_ENV_DISABLE_PROMPT=yes
function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}
add-zsh-hook precmd virtenv_indicator

bindkey -v
function zle-line-init zle-keymap-select {
    VRP="%{$fg[white]%}%(1V. (%1v).)"
    VIRP="%{$fg[blue]%}${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
    #RPS1="$VIRP$VRP%{$reset_color%}"
    RPS1="$VRP%{$reset_color%}"
    case $KEYMAP in
         #solid block
        vicmd)      printf "\033[2 q";; 
         #solid underscore
        viins|main) printf "\033[3 q";; 
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#Let's reduce after you hit the <ESC> key delay to 0.1 seconds.
export KEYTIMEOUT=1

autoload -U promptinit; promptinit
prompt pure
