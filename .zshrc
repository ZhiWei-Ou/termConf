export ZSH=$HOME/.oh-my-zsh

workrc="$HOME/.workrc/rc.local"
themerc="$HOME/.workrc/theme.local"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # the default theme
if [ -f $themerc ]; then
    eval $(cat $themerc)
fi

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

has() {
    command -v "$1" &> /dev/null
}

# alias setup
if has nvim; then
    alias vim='nvim'
    alias vi='nvim'
    export GIT_EDITOR=nvim
fi

# jq clipboard
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

# source workrc
if [ -f $workrc ]; then
    source $workrc
fi
