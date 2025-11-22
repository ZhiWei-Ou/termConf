export ZSH=$HOME/.oh-my-zsh

# Detect OS
OS_COLOR="white"
OS_ICON="$OSTYPE"
OS_NAME="$(uname -s)"
case "$OSTYPE" in
    darwin*)
        OS_ICON=""
        OS_NAME="macOS"
        OS_COLOR="white"
        ;;
    linux*)
        OS_ICON=""
        OS_NAME="Linux"
        OS_COLOR="yellow"
        ;;
    *)
        OS_ICON=""
        OS_NAME="Windows"
        OS_COLOR="blue"
        ;;
esac

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell" # the default theme
ZSH_THEME="" # Set to empty to disable theme features

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=( git extract zsh-syntax-highlighting)

# CMake completion in this path
# Reference: https://github.com/zsh-users/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

# Enable On-My-Zsh
source $ZSH/oh-my-zsh.sh

# Example: en_US.UTF-8 zh_CN.UTF-8 ja_JP.UTF-8 fr_FR.UTF-8 C.UTF-8
export LANG=en_US.UTF-8


#################################################################################
# Customize prompt
# ➜ (macOS) term_conf git:(main)
# ➜ (Ubuntu) term_conf git:(main)
# copy from 'robbyrussell'
# old -> '➜ term_conf git:(main)'
#   config: 
#       PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
#       PROMPT+=' $(git_prompt_info)'
# new -> '➜ (macOS) term_conf git:(main)' or '(Ubuntu) term_conf git:(main)'
#################################################################################
# >>>>
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[${OS_COLOR}]%}(${OS_ICON} ${OS_NAME})%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
# <<<<

# Set aliases
# >>>>
which nvim >/dev/null
if [ $? -eq 0 ]; then
    alias vim='nvim'
    alias vi='nvim'
    export GIT_EDITOR=nvim
fi
which fzf >/dev/null
if [ $? -eq 0 ]; then
    alias catf='cat $(fzf)'
    alias catpf='fzf --preview="cat {}"'
    alias vimf='vim $(fzf)'
fi
# <<<<

# Use system clipboard as the jq input
# >>>>
case "$(uname)" in
    "Darwin")
        alias jqclip='pbpaste | jq "."'
        ;;
    "Linux")
        alias jqclip='xclip -selection clipboard -o | jq "."'
        ;;
    *)
        ;;
esac
# <<<<

# Source custom .workrc/rc.local
# >>>>
workrc="$HOME/.workrc/rc.local"
if [ -f $workrc ]; then
    source $workrc
fi
# <<<<
