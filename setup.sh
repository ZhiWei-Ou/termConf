#!/bin/sh
set -eu

if [ "$#" -gt 1 ]; then
    printf 'Usage: %s [home-directory]\n' "$0" >&2
    exit 2
fi

repo_dir=$(CDPATH= cd -P "$(dirname "$0")" && pwd)
setup_home=${1:-$HOME}
mkdir -p "$setup_home"
setup_home=$(CDPATH= cd -P "$setup_home" && pwd)
backup_suffix="backup.$(date +%Y%m%d-%H%M%S).$$"

for config in .zshrc .tmux.conf .tmux.conf.local; do
    source_file="$repo_dir/$config"
    target_file="$setup_home/$config"

    if [ ! -f "$source_file" ]; then
        printf 'Missing configuration: %s\n' "$source_file" >&2
        exit 1
    fi
    if [ "$source_file" = "$target_file" ]; then
        continue
    fi
    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
        printf 'Already linked: %s\n' "$target_file"
        continue
    fi
    if [ -d "$target_file" ] && [ ! -L "$target_file" ]; then
        printf 'Cannot replace a directory: %s\n' "$target_file" >&2
        exit 1
    fi
    if [ -e "$target_file" ] || [ -L "$target_file" ]; then
        backup_file="$target_file.$backup_suffix"
        mv "$target_file" "$backup_file"
        printf 'Backed up: %s\n' "$backup_file"
    fi
    ln -s "$source_file" "$target_file"
    printf 'Linked: %s\n' "$target_file"
done

# Match the completion path exported by the repository's .zshrc.
export ZSH_COMPLETION_DIR="${ZSH_CUSTOM:-$setup_home/.oh-my-zsh/custom}/plugins/zsh-completions/src"
mkdir -p "$ZSH_COMPLETION_DIR" "$setup_home/.workrc"
printf 'Completion directory: %s\n' "$ZSH_COMPLETION_DIR"

workrc="$setup_home/.workrc/rc.local"
if [ -e "$workrc" ] || [ -L "$workrc" ]; then
    printf 'Kept existing: %s\n' "$workrc"
else
    cat > "$workrc" <<'EOF'
# Personal shell settings, loaded by ~/.zshrc.
# Keep machine-specific exports and aliases here.
# Example: export EDITOR=nvim
EOF
    printf 'Created: %s\n' "$workrc"
fi

printf '\nSetup complete. Start a new Zsh session or reload your .zshrc.\n'
