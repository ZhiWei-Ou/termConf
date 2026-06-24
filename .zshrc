export ZSH=$HOME/.oh-my-zsh

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

# Claude-style file colours for ls and completion lists.
export CLICOLOR=1
export LSCOLORS="gxAxhxhxBxhxhxBxBxhxhx"
export LS_COLORS="di=38;2;111;162;163:ln=38;2;95;89;83:or=38;2;95;89;83:mi=38;2;95;89;83:so=38;2;95;89;83:pi=38;2;95;89;83:ex=1;38;2;195;80;104:bd=38;2;95;89;83:cd=38;2;95;89;83:su=1;38;2;195;80;104:sg=1;38;2;195;80;104:tw=38;2;95;89;83:ow=38;2;95;89;83:st=38;2;95;89;83:fi=38;2;255;255;255"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


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
claude_accent=$'%{\e[38;2;255;155;114m%}'
claude_text=$'%{\e[38;2;216;208;200m%}'
claude_muted=$'%{\e[38;2;138;129;120m%}'
claude_yellow=$'%{\e[38;2;240;198;116m%}'
claude_reset=$'%{\e[0m%}'

PROMPT="%(?:${claude_accent}%1{➜%} :${claude_yellow}%1{➜%} ) ${claude_text}%c${claude_reset}"
PROMPT+=' $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${claude_muted}git:(${claude_accent}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${claude_reset} "
ZSH_THEME_GIT_PROMPT_DIRTY="${claude_muted}) ${claude_yellow}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="${claude_muted})"
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
